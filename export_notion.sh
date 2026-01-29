#!/bin/bash

# Notion to Markdown exporter
source /Users/admin/Workspace/work/competitive-analysis/.env.local

API_URL="https://api.notion.com/v1"
NOTION_VERSION="2022-06-28"

# Function to convert block to markdown
block_to_md() {
    local block="$1"
    local type=$(echo "$block" | jq -r '.type')

    case "$type" in
        "paragraph")
            echo "$block" | jq -r '.paragraph.rich_text | map(.plain_text) | join("")'
            echo ""
            ;;
        "heading_1")
            local text=$(echo "$block" | jq -r '.heading_1.rich_text | map(.plain_text) | join("")')
            echo "# $text"
            echo ""
            ;;
        "heading_2")
            local text=$(echo "$block" | jq -r '.heading_2.rich_text | map(.plain_text) | join("")')
            echo "## $text"
            echo ""
            ;;
        "heading_3")
            local text=$(echo "$block" | jq -r '.heading_3.rich_text | map(.plain_text) | join("")')
            echo "### $text"
            echo ""
            ;;
        "bulleted_list_item")
            local text=$(echo "$block" | jq -r '.bulleted_list_item.rich_text | map(.plain_text) | join("")')
            echo "- $text"
            ;;
        "numbered_list_item")
            local text=$(echo "$block" | jq -r '.numbered_list_item.rich_text | map(.plain_text) | join("")')
            echo "1. $text"
            ;;
        "to_do")
            local text=$(echo "$block" | jq -r '.to_do.rich_text | map(.plain_text) | join("")')
            local checked=$(echo "$block" | jq -r '.to_do.checked')
            if [ "$checked" = "true" ]; then
                echo "- [x] $text"
            else
                echo "- [ ] $text"
            fi
            ;;
        "toggle")
            local text=$(echo "$block" | jq -r '.toggle.rich_text | map(.plain_text) | join("")')
            echo "<details>"
            echo "<summary>$text</summary>"
            echo "</details>"
            echo ""
            ;;
        "code")
            local text=$(echo "$block" | jq -r '.code.rich_text | map(.plain_text) | join("")')
            local lang=$(echo "$block" | jq -r '.code.language')
            echo "\`\`\`$lang"
            echo "$text"
            echo "\`\`\`"
            echo ""
            ;;
        "quote")
            local text=$(echo "$block" | jq -r '.quote.rich_text | map(.plain_text) | join("")')
            echo "> $text"
            echo ""
            ;;
        "divider")
            echo "---"
            echo ""
            ;;
        "callout")
            local text=$(echo "$block" | jq -r '.callout.rich_text | map(.plain_text) | join("")')
            local icon=$(echo "$block" | jq -r '.callout.icon.emoji // ""')
            echo "> $icon $text"
            echo ""
            ;;
        "child_page")
            local title=$(echo "$block" | jq -r '.child_page.title')
            echo "📄 **[$title](./$title.md)**"
            echo ""
            ;;
        "table")
            echo "[Table]"
            echo ""
            ;;
        "image")
            local url=$(echo "$block" | jq -r '.image.file.url // .image.external.url // ""')
            if [ -n "$url" ] && [ "$url" != "null" ]; then
                echo "![]($url)"
                echo ""
            fi
            ;;
        "bookmark")
            local url=$(echo "$block" | jq -r '.bookmark.url')
            echo "🔗 $url"
            echo ""
            ;;
        "link_preview")
            local url=$(echo "$block" | jq -r '.link_preview.url')
            echo "🔗 $url"
            echo ""
            ;;
        *)
            # Skip unknown block types
            ;;
    esac
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

    # Sanitize filename
    local safe_title=$(echo "$title" | sed 's/[\/\\:*?"<>|]/-/g' | sed 's/  */ /g')
    local filepath="$output_dir/$safe_title.md"

    echo "Exporting: $title -> $filepath" >&2

    mkdir -p "$output_dir"

    # Start markdown file
    echo "# $title" > "$filepath"
    echo "" >> "$filepath"

    # Get page blocks
    local blocks=$(curl -s "$API_URL/blocks/$page_id/children?page_size=100" \
        -H "Authorization: Bearer $NOTION_API_KEY" \
        -H "Notion-Version: $NOTION_VERSION")

    # Process each block
    echo "$blocks" | jq -c '.results[]' | while read -r block; do
        local block_type=$(echo "$block" | jq -r '.type')
        local block_id=$(echo "$block" | jq -r '.id')
        local has_children=$(echo "$block" | jq -r '.has_children')

        # Convert block to markdown
        block_to_md "$block" >> "$filepath"

        # If it's a child page, export it recursively
        if [ "$block_type" = "child_page" ]; then
            local child_title=$(echo "$block" | jq -r '.child_page.title')
            local child_dir="$output_dir/$safe_title"
            export_page "$block_id" "$child_dir" $((depth + 1))
        fi

        # If block has children (nested content), fetch them
        if [ "$has_children" = "true" ] && [ "$block_type" != "child_page" ]; then
            local children=$(curl -s "$API_URL/blocks/$block_id/children?page_size=100" \
                -H "Authorization: Bearer $NOTION_API_KEY" \
                -H "Notion-Version: $NOTION_VERSION")

            echo "$children" | jq -c '.results[]' | while read -r child_block; do
                echo "  " >> "$filepath"
                block_to_md "$child_block" >> "$filepath"
            done
        fi
    done
}

# Export function for external use
export -f block_to_md
export -f export_page
export NOTION_API_KEY
export API_URL
export NOTION_VERSION
