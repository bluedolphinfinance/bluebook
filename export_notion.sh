#!/bin/bash

# Notion to Markdown exporter
source /Users/admin/Workspace/work/competitive-analysis/.env.local

API_URL="https://api.notion.com/v1"
NOTION_VERSION="2022-06-28"

# Function to convert rich_text array to markdown (handles bold, italic, code, etc.)
rich_text_to_md() {
    local rich_text="$1"
    echo "$rich_text" | jq -r '
        [.[] |
            (if .annotations.bold then "**" else "" end) +
            (if .annotations.italic then "*" else "" end) +
            (if .annotations.code then "`" else "" end) +
            .plain_text +
            (if .annotations.code then "`" else "" end) +
            (if .annotations.italic then "*" else "" end) +
            (if .annotations.bold then "**" else "" end)
        ] | join("")
    '
}

# Function to fetch table content
fetch_table() {
    local block_id="$1"
    local indent="$2"

    local rows=$(curl -s "$API_URL/blocks/$block_id/children?page_size=100" \
        -H "Authorization: Bearer $NOTION_API_KEY" \
        -H "Notion-Version: $NOTION_VERSION")

    local first_row=true
    echo "$rows" | jq -c '.results[]' | while read -r row; do
        local cells=$(echo "$row" | jq -r '.table_row.cells | map(.[0].plain_text // "") | join(" | ")')
        echo "$indent| $cells |"

        # Add separator after header row
        if [ "$first_row" = true ]; then
            local col_count=$(echo "$row" | jq '.table_row.cells | length')
            local separator=$(printf '|---%.0s' $(seq 1 $col_count))
            echo "$indent$separator|"
            first_row=false
        fi
    done
}

# Function to convert block to markdown with indentation
block_to_md() {
    local block="$1"
    local indent="$2"
    local list_index="$3"
    local type=$(echo "$block" | jq -r '.type')

    case "$type" in
        "paragraph")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.paragraph.rich_text')")
            if [ -n "$text" ]; then
                echo "${indent}${text}"
                echo ""
            fi
            ;;
        "heading_1")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.heading_1.rich_text')")
            echo "${indent}# $text"
            echo ""
            ;;
        "heading_2")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.heading_2.rich_text')")
            echo "${indent}## $text"
            echo ""
            ;;
        "heading_3")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.heading_3.rich_text')")
            echo "${indent}### $text"
            echo ""
            ;;
        "bulleted_list_item")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.bulleted_list_item.rich_text')")
            echo "${indent}- $text"
            ;;
        "numbered_list_item")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.numbered_list_item.rich_text')")
            echo "${indent}${list_index}. $text"
            ;;
        "to_do")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.to_do.rich_text')")
            local checked=$(echo "$block" | jq -r '.to_do.checked')
            if [ "$checked" = "true" ]; then
                echo "${indent}- [x] $text"
            else
                echo "${indent}- [ ] $text"
            fi
            ;;
        "toggle")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.toggle.rich_text')")
            echo ""
            echo "${indent}## $text"
            echo ""
            ;;
        "code")
            local text=$(echo "$block" | jq -r '.code.rich_text | map(.plain_text) | join("")')
            local lang=$(echo "$block" | jq -r '.code.language')
            echo "${indent}\`\`\`$lang"
            echo "$text"
            echo "${indent}\`\`\`"
            echo ""
            ;;
        "quote")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.quote.rich_text')")
            echo "${indent}> $text"
            echo ""
            ;;
        "divider")
            echo "${indent}---"
            echo ""
            ;;
        "callout")
            local text=$(rich_text_to_md "$(echo "$block" | jq '.callout.rich_text')")
            local icon=$(echo "$block" | jq -r '.callout.icon.emoji // ""')
            echo "${indent}> $icon $text"
            echo ""
            ;;
        "child_page")
            local title=$(echo "$block" | jq -r '.child_page.title')
            echo "${indent}📄 **[$title](./$title.md)**"
            echo ""
            ;;
        "table")
            local block_id=$(echo "$block" | jq -r '.id')
            fetch_table "$block_id" "$indent"
            echo ""
            ;;
        "image")
            local url=$(echo "$block" | jq -r '.image.file.url // .image.external.url // ""')
            if [ -n "$url" ] && [ "$url" != "null" ]; then
                echo "${indent}![]($url)"
                echo ""
            fi
            ;;
        "bookmark")
            local url=$(echo "$block" | jq -r '.bookmark.url')
            local caption=$(echo "$block" | jq -r '.bookmark.caption[0].plain_text // ""')
            if [ -n "$caption" ]; then
                echo "${indent}🔗 **$caption**: $url"
            else
                echo "${indent}🔗 $url"
            fi
            echo ""
            ;;
        "link_preview")
            local url=$(echo "$block" | jq -r '.link_preview.url')
            echo "${indent}🔗 $url"
            echo ""
            ;;
        *)
            # Skip unknown block types
            ;;
    esac
}

# Recursive function to process blocks with children
process_blocks_recursive() {
    local parent_id="$1"
    local output_file="$2"
    local indent="$3"
    local depth="${4:-0}"

    if [ "$depth" -gt 10 ]; then
        echo "Max depth reached" >&2
        return
    fi

    local blocks=$(curl -s "$API_URL/blocks/$parent_id/children?page_size=100" \
        -H "Authorization: Bearer $NOTION_API_KEY" \
        -H "Notion-Version: $NOTION_VERSION")

    local list_index=1
    local prev_type=""

    echo "$blocks" | jq -c '.results[]' | while read -r block; do
        local block_type=$(echo "$block" | jq -r '.type')
        local block_id=$(echo "$block" | jq -r '.id')
        local has_children=$(echo "$block" | jq -r '.has_children')

        # Reset list counter if type changes
        if [ "$block_type" != "$prev_type" ]; then
            list_index=1
        fi

        # Convert block to markdown
        block_to_md "$block" "$indent" "$list_index" >> "$output_file"

        # Increment list counter for numbered lists
        if [ "$block_type" = "numbered_list_item" ]; then
            list_index=$((list_index + 1))
        fi

        prev_type="$block_type"

        # Handle child pages separately
        if [ "$block_type" = "child_page" ]; then
            # Child pages are handled by the main export function
            continue
        fi

        # Recursively process children (except tables which are handled in block_to_md)
        if [ "$has_children" = "true" ] && [ "$block_type" != "table" ]; then
            local child_indent="${indent}  "
            process_blocks_recursive "$block_id" "$output_file" "$child_indent" $((depth + 1))
        fi
    done
}

# Function to fetch and convert a page
export_page() {
    local page_id="$1"
    local output_dir="$2"
    local depth="${3:-0}"

    if [ "$depth" -gt 5 ]; then
        echo "Max depth reached for $page_id" >&2
        return
    fi

    # Get page info
    local page_info=$(curl -s "$API_URL/pages/$page_id" \
        -H "Authorization: Bearer $NOTION_API_KEY" \
        -H "Notion-Version: $NOTION_VERSION")

    local title=$(echo "$page_info" | jq -r '.properties.title.title[0].plain_text // .properties.Name.title[0].plain_text // "untitled"')
    local icon=$(echo "$page_info" | jq -r '.icon.emoji // ""')

    # Sanitize filename
    local safe_title=$(echo "$title" | sed "s/['\']/'/" | sed 's/[\/\\:*?"<>|]/-/g' | sed 's/  */ /g' | sed 's/ *$//')
    local filepath="$output_dir/$safe_title.md"

    echo "Exporting: $title -> $filepath" >&2

    mkdir -p "$output_dir"

    # Start markdown file with icon if present
    if [ -n "$icon" ]; then
        echo "# $icon $title" > "$filepath"
    else
        echo "# $title" > "$filepath"
    fi
    echo "" >> "$filepath"

    # Process blocks recursively
    process_blocks_recursive "$page_id" "$filepath" "" 0

    # Find and export child pages
    local blocks=$(curl -s "$API_URL/blocks/$page_id/children?page_size=100" \
        -H "Authorization: Bearer $NOTION_API_KEY" \
        -H "Notion-Version: $NOTION_VERSION")

    echo "$blocks" | jq -c '.results[] | select(.type == "child_page")' | while read -r block; do
        local block_id=$(echo "$block" | jq -r '.id')
        local child_title=$(echo "$block" | jq -r '.child_page.title')
        local child_dir="$output_dir/$safe_title"
        export_page "$block_id" "$child_dir" $((depth + 1))
    done
}

# Export function for external use
export -f rich_text_to_md
export -f fetch_table
export -f block_to_md
export -f process_blocks_recursive
export -f export_page
export NOTION_API_KEY
export API_URL
export NOTION_VERSION
