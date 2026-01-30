# DeFI

## Pages

- 📄 [Planning semaines](./DeFI/Planning%20semaines.md)

---

# OBJECTIF FINAL [clair]

À la fin :
- Tu comprends **toute la stack DeFi moderne** (infra → protocoles → risques)
- Tu sais **analyser un vault / market / stratégie**
- Tu peux **designer et opérer une stratégie Morpho crédible**
- Tu es légitime pour être **curator / allocateur / risk partner**

# VUE D'ENSEMBLE [6 mois]

| Phase | Durée | Focus |
|---|---|---|
| 0 | 1 semaine | Mise à niveau express & mental model |
| 1 | 4–5 semaines | Infra, Ethereum, L2, mécanique on-chain |
| 2 | 5–6 semaines | DeFi core (lending, DEX, stablecoins, risk) |
| 3 | 5–6 semaines | DeFi avancée + Morpho + structuration business |
| 4 | continu | Veille, crédibilité, réseau |

# PHASE 0 — RESET & MENTAL MODELS [1 semaine]

## Objectif

Reconnecter ton cerveau de financier à la **logique on-chain** (comptabilité, risque, settlement).

### À comprendre absolument
- On-chain ≠ off-chain finance
- Code = loi
- Pas de "bilan", mais des **positions atomiques**
- Le **risk management est public et instantané**

### Ressources
- 📘 *"How DeFi works"* — Finematics (YouTube)
- 📘 Vitalik – *"The meaning of decentralization"*
- 📘 Paradigm – *"DeFi risk framework"*

🎯 Output :

> Être capable d'expliquer à un financier tradfi pourquoi la DeFi n'est ni un casino, ni une banque

# PHASE 1 — INFRA & TECH STACK [Semaines 2 à 6]

## 1. Ethereum & EVM [tu dois être fluent]

**À maîtriser :**
- Comptes (EOA vs contracts)
- Gas, calldata, storage
- Reentrancy, approvals, allowances
- ERC20 / ERC4626 (CRUCIAL pour vaults)

### Ressources
- 📘 *Ethereum Yellow Paper* (lecture ciblée)
- 📘 https://ethereum.org/en/developers/docs/
- 🎥 Patrick Collins – *Blockchain basics*

## 2. Layer 2 & modularité

**Pourquoi Morpho est massivement L2-first**
- Optimistic vs ZK rollups
- Sequencers, MEV, bridging risks
- EigenLayer, restaking (risque systémique)

### Ressources
- 📘 L2Beat (indispensable)
- 📘 Bankless – *Rollup thesis*
- 📘 Celestia / modular blockchain articles

🎯 Output :

> Tu sais expliquer pourquoi Base ≠ Arbitrum ≠ Optimism du point de vue risk & UX

## 3. Oracles & MEV
- Chainlink vs Pyth vs Redstone
- Sandwich, liquidations MEV
- Pourquoi les oracles sont le **talon d'Achille**

📘 Flashbots documentation

📘 Chainlink economics papers

# PHASE 2 — DEFI CORE [Semaines 7 à 12]

## 1. Lending / Borrowing [cœur du sujet]

**À décortiquer :**
- Aave v2 / v3
- Compound v3
- Morpho Blue (en profondeur)

Concepts clés :
- Collateral factor
- Liquidation bonus
- Interest rate curves
- Isolation mode
- Oracle lag risk

### Ressources
- 📘 Aave whitepaper
- 📘 Morpho Blue docs (à lire ligne par ligne)
- 📘 Gauntlet risk analyses

🎯 Output :

> Tu sais évaluer un market de lending comme un desk de crédit

## 2. DEX & AMM modernes
- Uniswap v2 vs v3 (LP = options seller)
- Curve (stableswap math)
- Concentrated liquidity
- Impermanent loss ≠ vrai risque

📘 Uniswap v3 whitepaper

📘 Curve math explained (Medium)

## 3. Stablecoins [CRITIQUE]
- USDC vs USDT vs DAI
- RWA-backed stables
- Depeg scenarios
- Yield-bearing stables

📘 MakerDAO docs

📘 Ethena (analyse critique obligatoire)

# PHASE 3 — DEFI AVANCÉE & MORPHO BUSINESS [Semaines 13 à 18]

## 1. Morpho Blue & curation

**À maîtriser absolument :**
- Permissionless markets
- Role du curator
- Risk params (LLTV, oracle, liquidation)
- Fee structure & incentives

📘 Morpho docs

📘 Forums Morpho (lectures obligatoires)

🎯 Output :

> Tu sais designer un vault Morpho de A à Z

## 2. Risk management on-chain
- Smart contract risk
- Oracle manipulation
- Liquidity crunch
- Governance risk
- Black swan (LST depeg, bridge failure)

📘 DeFiSafety

📘 Immunefi post-mortems

## 3. Structuration business

**Curator = asset manager on-chain**
- Branding & trust
- Track record on test vault
- Transparency & reporting
- Alignement d'intérêts

📘 Token Terminal

📘 DefiLlama (flows & AUM analysis)

🎯 Output :

> Tu peux pitcher ton activité à un LP crypto sérieux

# PHASE 4 — VEILLE & LÉGITIMITÉ [continu]

## À suivre quotidiennement
- Twitter (X) :
  - @morpho_labs
  - @gauntlet_xyz
  - @paradigm
  - @flashbots
- Forums :
  - Morpho
  - Aave governance
- Newsletters :
  - Bankless
  - The Defiant
  - Delphi Digital

# BONUS — PROJET PRATIQUE [fortement recommandé]

👉 **Créer un "shadow fund"**
- 1 vault Morpho test
- 1 stratégie conservative
- Reporting hebdo
- Post-mortem public

C'est **100× plus crédible** qu'un diplôme.

# RÉALITÉ DU MÉTIER [franc]
- La compétence clé ≠ trading
- C'est **risk + crédibilité + constance**
- Les meilleurs allocateurs sont **ennuyeux mais solides**
