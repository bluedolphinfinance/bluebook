# Sparklend

> Lending protocol powered by Sky (ex-MakerDAO)

## Fiche Protocole

| Champ | Valeur |
|-------|--------|
| **Category** | Onchain AM |
| **Type** | Lending/Borrowing |
| **Chain** | Ethereum (L1), Gnosis |
| **TVL** | $3.6B |
| **Token** | SPK |
| **MCap** | $44M |
| **Risk Level** | - |
| **BD Interest** | Medium |
| **Yield Source** | Overcollateralized |
| **Audit Status** | NR |
| **Links** | https://spark.fi/ |

---

# 📋 Fiche d'Analyse : SparkLend (ex-Maker Lending)

**Modèle :** Marché monétaire décentralisé sur-collatéralisé (Money Market, fork Aave V3)

## 1. Identité et Vision

- **Maturité & Historique :** SparkLend est lancé en Mai **2023** comme bras "lending" de **Spark Protocol**, lui-même émanation directe de l'écosystème **MakerDAO** (aujourd'hui Sky).
- **Proposition de Valeur :** Transformer la **liquidité structurelle du DAI** (et maintenant USDS) en rendement, tout en offrant un marché de prêt robuste, conservateur et fortement contrôlé sur le risque. Spark n'essaie pas d'être le plus agressif : il vise la **prévisibilité, la résilience et la lisibilité du risque**.
- **Nature du Produit :** Money market **over-collatéralisé**, très proche d'**Aave V3**, avec des paramètres de risque volontairement plus stricts.

## 2. Architecture Technique & Produit

- **Base Technique :** Fork d'**Aave V3**, donc :
  - Pools isolées
  - Gestion fine des LTV / liquidation thresholds
  - Mode efficacité (E-Mode) pour les stablecoins
  - Oracles **Chainlink**
- **Actifs Clés :**
  - **DAI / USDS** : cœur du système
  - ETH, stETH, WBTC
  - Peu d'actifs "long tail" → approche très institutionnelle
- **Spark sDAI :** Brique centrale : le **DAI placé dans Spark** peut être redirigé vers SparkLend, Maker (DSR), ou RWA (T-Bills tokenisés, etc.). 👉 On peut voir Spark comme un **desk d'allocation de liquidité on-chain**, piloté par la gouvernance Maker.
- **Gouvernance & Contrôle :** Totalement piloté par **MakerDAO / Sky**, avec ajustement dynamique des taux, caps d'endettement, et paramètres de liquidation très conservateurs.

## 3. Métriques de Performance & Santé (fin 2025 – ordres de grandeur)

| **Métrique** | **Valeur** | **Tendance / Commentaire** |
|--------------|------------|---------------------------|
| **TVL** | ~3 – 3.5 Md$ | Dominée par DAI/USDS |
| **Supply totale** | ~5 - 5.5 Md$ | Majoritairement stablecoins |
| **Borrow total** | ~ 1,5 Md$ | Utilisation modérée |
| **Utilisation (Borrow/Supply)** | ~30 – 40% | Zone saine (pas de stress de liquidité) |
| **Yield sDAI** | ~4% | Ancré aux taux sans risque on-chain |
| **Liquidations** | Faibles | Paramètres très prudents |

👉 Profil **low volatility / low surprise**, proche d'un **repo market sur-collatéralisé**.

## 4. Analyse de la Valorisation & Tokenomics

- **Token natif :** ❌ **Pas de token Spark autonome** (SPK ne vaut pas ce que Spark gagne, il vaut ce que Spark pourrait devenir). ✅ Capture de valeur indirecte via **MKR / SKY**.
- **Mécanisme de Capture de Valeur :** Les intérêts payés par les borrowers reviennent in fine à :
  - la trésorerie Maker
  - les détenteurs de MKR/SKY via burn / buyback

  Spark est donc une **extension du P&L de Maker**.
- **Lecture financière :** Spark =
  > un centre de profit relativement stable, peu risqué, augmentant la duration et la visibilité des cash-flows Maker.

## 5. Matrice des Risques (Risk Vector Analysis)

### 🔹 Risque de Crédit

- Faible :
  - Over-collatéralisation stricte
  - Actifs très liquides
  - Stress tests hérités de Maker
- Le principal risque vient d'un **de-peg DAI/USDS**, mais Spark est justement un outil de stabilisation.

### 🔹 Risque de Smart Contract

- Code largement dérivé d'Aave V3
- Surface d'attaque limitée par :
  - peu d'actifs
  - peu de features exotiques

### 🔹 Risque de Gouvernance

- **Centralisation assumée**
- Les décisions sont lentes mais rationnelles

### 🔹 Risque de Liquidité

- Faible sur les stables
- ETH / stETH bien couverts
- Peu d'exposition aux actifs corrélés exotiques

## 6. Points de Vigilance & Zones d'Ombre

- **Dépendance extrême à MakerDAO :** Spark **n'est pas un protocole autonome**. Si Maker change de cap stratégique (RWA, off-chain, réglementation), Spark suivra.
- **Upside limité :** Ce n'est **pas** un protocole "growth". Pas de token farming, pas d'APY explosif → upside surtout défensif.
- **Risque réglementaire indirect :** L'exposition aux RWA et à des actifs type T-Bills tokenisés pourrait, à terme, attirer l'attention des régulateurs.

## 7. Lecture Financière Synthétique (pour cerveau buy-side)

> SparkLend ressemble moins à un protocole DeFi "pur" qu'à un desk de transformation de maturité et de risque on-chain, très proche dans l'esprit d'un collateralized funding book.

- ✔ Rendement lisible
- ✔ Alignement avec une gouvernance mature
- ❌ Peu d'optionalité haussière

### 🧠 **Note Analyste DeFi**

SparkLend est probablement **le money market le plus "institutionnel" de la DeFi**.

Idéal pour :

- parquer du stablecoin
- construire une jambe "risk-free on-chain"
- comprendre la DeFi sans s'exposer à des risques de design agressifs

---

*Fiche générée depuis la base de données DeFi Protocols*
