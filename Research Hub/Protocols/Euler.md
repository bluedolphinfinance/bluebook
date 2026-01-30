# Euler

> Modular lending protocol

## Fiche Protocole

| Champ | Valeur |
|-------|--------|
| **Category** | Vault Infrastructure |
| **Type** | Lending/Borrowing |
| **Chain** | Ethereum (L1), BNB Chain, Unichain, Monad, Sonic, TAC, Swellchain, Base, Plasma, Arbitrum, Avalanche, Linea, BOB, Berachain |
| **TVL** | $1.0B |
| **Token** | EUL |
| **MCap** | $56M |
| **Risk Level** | Tier II |
| **BD Interest** | Medium |
| **Yield Source** | Overcollateralized |
| **Audit Status** | NR |
| **Risk Flags** | ⚠️ Hack (historique) |
| **Links** | https://app.euler.finance |

---

### 📋 Fiche d'Analyse : Euler Finance

**Modèle : Infrastructure de Crédit Modulaire**

**1. Identité et Vision**

- **Maturité :** Lancé fin 2021. Après un incident majeur en 2023, le protocole a redémarré avec une V2 modulaire fin 2024.
- **Proposition de valeur :** Permettre la création de marchés de prêt sans permission (permissionless) et de stratégies de levier sophistiquées.
- **Nature du produit :** Infrastructure de base (Layer de liquidité). Euler fournit les "briques" pour que d'autres construisent des coffres (Vaults).

**2. Analyse de l'Architecture Produit**

- **Produit Phare :** **Euler Earn**
  - **Euler Earn** est une architecture de **vaults ERC-4626** modulaires permettant le prêt d'actifs via des stratégies d'optimisation de rendement (yield) avec une gestion granulaire du risque et du collatéral.
- **Produit AMM :** taille très petite
- **Modularité :** Euler laisse des "Risk Curators" gérer les paramètres de risque des différents Vaults. Contrairement à un modèle de gouvernance monolithique, la V2 d'Euler repose sur la réputation de ces curators.
  - **Rôle des Risk Curators :** Entités tierces (ex: Usual, Sentora, Gauntlet, Euler DAO, …) responsables de définir les paramètres de risque (LTV, facteurs d'emprunt, limites de crédit) pour des coffres spécifiques.
  - **Indépendance du Risque :** Ce modèle permet de segmenter le risque : une défaillance de paramétrage dans un Vault géré par un curateur n'impacte pas la solvabilité des autres Vaults.
  - **Critères de Sélection :** La performance des curateurs est mesurée par leur capacité à éviter les créances douteuses tout en optimisant le ratio d'utilisation des actifs.
- **Déploiement :** Multi-chain. Mainnet (800 M$) et Plasma (86 M$).

🔗 https://defillama.com/protocol/euler

**3. Métriques de Performance & Valorisation (Déc. 2025)**

- **Santé financière :**
  - **TVL : 1 Md$** (Équilibre parfait : 1 Md$ Borrow / 2 Md$ Supply).
- **Économie du protocole :**
  - **Fees YTD :** 65 M$.
  - **Revenues YTD :** 4 M$.
  - **Earnings (Revenus nets) :** 2,3 M$ (Après déduction de 1,7 M$ d'incentives pour attirer la liquidité).
- **Valorisation :**
  - **Market Cap :** 55M$ - 80M$.
  - **PER (Price Earning Ratio) : 30 à 40.** C'est un multiple élevé qui montre que le marché parie sur une explosion de l'usage d'Euler Earn en 2026.

**4. Tokenomics et Capture de Valeur**

- **Rôle du token :** **EUL** (Gouvernance).
- **Capture de valeur :** **Fee Flow Auctions**.
  - Le protocole met aux enchères les frais collectés. Les participants doivent "payer" en EUL pour récupérer ces actifs, créant une pression acheteuse constante et organique sur le token.
- **Governance voting rights**

**5. Points de Vigilance et "Zones d'Ombre"**

- **Complexité UI/UX :** L'onglet "Strategies" est encore déroutant (renvoie vers "Borrow"), ce qui rend l'expérience utilisateur difficile pour les non-experts.
- **Adoption des segments :** Le segment AMM est quasi inexistant ("nowhere"). Tout repose sur la réussite du lending modulaire.

---

*Fiche générée depuis la base de données DeFi Protocols*
