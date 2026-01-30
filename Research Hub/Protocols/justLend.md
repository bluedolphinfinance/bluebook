# justLend

> Protocole de lending sur Tron

## Fiche Protocole

| Champ | Valeur |
|-------|--------|
| **Category** | SBM Infrastructure |
| **Type** | Lending/Borrowing |
| **Chain** | Tron |
| **TVL** | $3.8B |
| **Token** | JUST |
| **MCap** | $340M |
| **Risk Level** | - |
| **BD Interest** | Low |
| **Yield Source** | Overcollateralized |
| **Audit Status** | NR |
| **Links** | https://justlend.org/ |

---

# 📋 Fiche d'Analyse : JustLend DAO

**Modèle :** Marché monétaire décentralisé algorithmique (Money Market)

### 1. Identité et Vision

- **Maturité & Historique :** Lancé en 2020. C'est le protocole phare de l'écosystème TRON (lié à Justin Sun). Il a survécu à plusieurs cycles de marché sans incident majeur de smart contract.
- **Proposition de Valeur :** Fournir une liquidité instantanée et des marchés de prêt à faible coût pour les actifs TRC-20, tout en servant de socle à la stabilité de l'USDD (stablecoin algorithmique de TRON).
- **Nature du Produit :** Pool de liquidité globale (similaire au modèle Aave V2/V3) fonctionnant sur le réseau TRON.

### 2. Architecture Technique & Produit

- **Composants Clés :** **jTokens** (équivalent des aTokens d'Aave) représentant la part de l'utilisateur dans la pool et accumulant les intérêts. Intégration de **sTRX** pour le staking liquide.
- **Modularité & Gouvernance :** Géré par le **JUST DAO**. Les détenteurs de tokens **JST** votent sur les facteurs de collatéral et les modèles de taux d'intérêt.
- **Déploiement & Écosystème :** Exclusivement sur la blockchain **TRON**. Intégration profonde avec SunSwap (DEX) et l'infrastructure USDD.
- **Mécanisme de Prêt :** Principalement sur-collatéralisé. Utilise des Oracles (Chainlink et oracles natifs) pour les prix en temps réel.

### 3. Métriques de Performance & Santé (Déc. 2025)

| **Métrique** | **Valeur** | **Tendance / Commentaire** |
|--------------|------------|---------------------------|
| **TVL (Total Value Locked)** | **~3,7 Md$** | En forte croissance (plus haut historique en déc. 2025). |
| **Utilisation (Borrow/Supply)** | ~30-50% | Varie selon les actifs. Supply à 4 Md$ / Borrow à 2 Md$. |
| **Fees** | ~13 M$ (est. YTD) | Volume élevé porté par les prêts de stablecoins (USDT/USDD). |
| Revenus | 0,75 M$ | |
| Holder Revenu | 0 M$ | |

### 4. Analyse de la Valorisation & Tokenomics

- **Token :** **JST** (Gouvernance).
- **Capture de Valeur :** **Mécanisme de Buy-back & Burn** (Plan de 60 M$ lancé fin 2024/2025). Le protocole utilise les revenus nets dépassant 10 M$ pour racheter et détruire du JST, créant un modèle déflationniste. <mark>(vérifier)</mark>
- **Rôle secondaire :** JST est utilisé pour payer les frais de gouvernance et participer aux décisions de l'écosystème JUST.

### 5. Matrice des Risques (Risk Vector Analysis)

- **Risque de Crédit :** Globalement faible sur les actifs majeurs (TRX, USDT), mais surveillance requise sur l'**USDD** qui présente des risques de désancrage (de-peg) par le passé.
- **Risque de Smart Contract :** Éprouvé par le temps (4 ans d'existence). Cependant, l'architecture est moins "modulaire" que Euler V2, ce qui expose l'ensemble de la TVL en cas de faille unique.
- **Risque de Centralisation :** Forte influence de l'écosystème de Justin Sun. La gouvernance pourrait être perçue comme moins décentralisée que celle d'Aave ou d'Euler.
- **Risque de Liquidité :** Risque lié à la sortie massive de TRX en cas de crise systémique sur l'écosystème TRON.

### 6. Points de Vigilance & "Zones d'Ombre"

- **Transparence de la Collatéralisation :** La qualité des réserves adossées à l'USDD (souvent utilisé comme collatéral) est parfois débattue par les analystes de risque.
- **Dépendance Écosystémique :** Si TRON perd en attractivité par rapport aux L2 d'Ethereum, JustLend pourrait voir sa TVL s'éroder rapidement.

---

**Analyste DeFi - Note :** JustLend est une "vache à lait" de rendement stable pour ceux déjà exposés à l'écosystème TRON, mais il présente un profil de risque de centralisation plus élevé que les protocoles modulaires comme Euler.

<details>
<summary>USDD</summary>

*À documenter*

</details>

---

*Fiche générée depuis la base de données DeFi Protocols*
