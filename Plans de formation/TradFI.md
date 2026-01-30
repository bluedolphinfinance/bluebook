# TradFI

# Vue d'ensemble du parcours

> Objectif final : Être capable de **lire un produit TradFi comme un smart contract**,

comprendre **le pricing**, **les risques**, et **reproduire mentalement l’équivalent DeFi**

**Ordre pédagogique :**
1. Marchés & actifs (le "terrain de jeu")
2. Indices & ETF (tokenisation TradFi)
3. Fixed Income (fondation temporelle)
4. Taux, ZC, discounting → Pendle bridge
5. Repo & lending (collatéralisation TradFi)
6. Futures, perps & arbitrages delta-neutral
7. Market making & microstructure
8. Options (payoffs → structuration)
9. Portefeuille & allocation (Markowitz → vault design)
10. Produits structurés & ingénierie financière
11. Risk management & stress
12. Synthèse TradFi ↔ DeFi

# MODULE 0 — Fondements mathématiques [prérequis]

> Ce module est un prérequis. Il peut être parcouru rapidement si les bases sont acquises, mais il est indispensable pour comprendre les modules Options, Volatilité et Risk Management.

### 🎯 Objectif

Acquérir les **outils mathématiques de base** pour comprendre le pricing et le risque en finance

### Partie 1 : Probabilités & statistiques
- **Espérance** (moyenne pondérée par les probabilités)
- **Variance** / **écart-type** (mesure de dispersion = risque)
- **Loi normale** (la "courbe en cloche") : 68% à ±1σ, 95% à ±2σ, 99.7% à ±3σ
- **Quantiles** (le 5ème percentile = VaR 95%)
- **Covariance** / **corrélation** (comment deux actifs bougent ensemble)

### Partie 2 : Actualisation & capitalisation
- **Valeur future** : FV = PV × (1 + r)^n
- **Valeur présente** : PV = FV / (1 + r)^n
- **Taux continu** vs **taux discret** : e^(r×t) vs (1 + r)^t
- **Équivalence de taux** (annuel ↔ mensuel ↔ continu)

### Partie 3 : Introduction aux processus stochastiques
- **Marche aléatoire** — le prix de demain = prix aujourd'hui + choc aléatoire
- **Mouvement brownien** — la limite continue d'une marche aléatoire
- **Drift vs diffusion** — tendance vs bruit
- **Propriété de Markov** — le futur ne dépend que du présent

### Partie 4 : Notion de risk-neutral
- Pourquoi on price "sous la probabilité risque-neutre"
- On actualise les payoffs espérés au taux sans risque
- Pas besoin de connaître les "vraies" probabilités pour pricer

### Pont DeFi
- Loi normale → distributions fat-tailed en crypto (crashes plus fréquents)
- Corrélation stable → corrélation qui explose en période de stress
- Taux sans risque → taux des stablecoins sur Aave/Morpho
- Mouvement brownien → VRF Chainlink pour l'aléa vérifiable

# MODULE 1 — Actifs financiers & marchés [fondations]

### 🎯 Objectif

Comprendre **ce qui s'échange**, **où**, **entre qui**, et **pourquoi**

### Concepts
- Actions (equity)
- Obligations (debt)
- Produits dérivés (futures, options, swaps)
- Cash vs dérivés
- Marchés primaires vs secondaires
- Participants :
  - investisseurs
  - market makers
  - banques
  - fonds
  - clearing houses

### Pont DeFi

| TradFi | DeFi |
|---|---|
| Actions | Tokens |
| Obligations | Yield-bearing tokens |
| Bourse | DEX / CEX |
| Clearing house | Smart contract |

# MODULE 2 — Indices & ETF [paniers tokenisés]

### 🎯 Objectif

Comprendre **ce qu'est un indice**, et pourquoi les ETF dominent le marché

### Concepts
- Indice = règle de construction d'un panier
- Pondération :
  - capi-weighted
  - equal-weighted
  - factor-based
- Rééquilibrage
- Tracking error
- ETF physiques vs synthétiques
- Rôle de l'Authorized Participant

### Pont DeFi
- ETF ≈ **vault passif**
- Indice ≈ **smart contract de rebalancing**
- ETF synthétique ≈ **delta-neutral + swap**

# MODULE 3 — Fixed Income : la brique temporelle

> C'est le module clé pour comprendre Pendle

### 🎯 Objectif

Comprendre **comment le temps crée de la valeur**

### Concepts
- Obligation = flux futurs
- Coupon vs zéro coupon
- Maturité
- Yield to maturity
- Courbe des taux
- Sensibilité aux taux (duration)

### Pont DeFi

| TradFi | DeFi |
|---|---|
| Coupon | Yield |
| Maturité | Expiry |
| Zéro coupon | PT Pendle |
| Obligation | Yield-bearing token |

# MODULE 4 — Discounting & Zéro Coupon [Pendle unlock]

### 🎯 Objectif

Savoir **pricer un flux futur**

### Concepts
- Valeur temps de l'argent
- Discount factor
- Pricing d'un zéro coupon
- Forward rates implicites
- Décomposition obligation = ZC strip

### 🔥 Pont direct avec Pendle
- PT = zéro coupon
- YT = coupon flottant
- AMM Pendle = **marché des taux implicites**
- Arbitrage PT ↔ spot yield

👉 À ce stade, **Pendle devient évident**

# MODULE 4b — Swaps de taux [IRS]

> Le marché des swaps de taux est le plus gros marché dérivé au monde (~$400 trillion de notionnel). Impossible de prétendre comprendre les taux sans maîtriser ce produit.

### 🎯 Objectif

Comprendre **le produit dérivé de taux le plus important** : l'Interest Rate Swap

### Partie 1 : Définition
- **IRS (Interest Rate Swap)** = échange de flux entre deux parties
- Partie A paie un **taux fixe**
- Partie B paie un **taux variable** (flottant)
- Même notionnel, pas d'échange de principal

### Partie 2 : Pourquoi ça existe ?
- **Hedging** : une entreprise endettée à taux variable veut fixer son coût
- **Spéculation** : parier sur la direction des taux
- **Arbitrage** : exploiter des inefficiences entre marchés cash et dérivés

### Partie 3 : Pricing d'un swap
- Un swap = **portefeuille de forwards sur taux**
- À l'initiation, la valeur du swap = 0
- **Swap rate** = le taux fixe qui rend le swap at-the-money

### Partie 4 : Courbe swap vs courbe gouvernementale
- **Courbe swap** = construite à partir des taux swap de marché
- **Courbe gouvernementale** = construite à partir des obligations d'État
- **Swap spread** = Swap rate - Taux gouvernemental (reflète le risque bancaire)

### Partie 5 : Autres swaps
- **Basis swap** : flottant vs flottant (ex: EURIBOR 3M vs EURIBOR 6M)
- **Cross-currency swap** : échange de taux + devises
- **OIS (Overnight Index Swap)** : taux fixe vs taux overnight (€STR, SOFR)

### Pont DeFi
- IRS (fixed vs floating) → **Notional Finance, Term Finance, Pendle**
- Taux flottant (EURIBOR) → Taux variable Aave/Morpho
- Swap rate → "Implied fixed rate" sur Pendle
- OIS → Taux overnight des stablecoins

> Insight : Un swap est un pari sur la trajectoire des taux, pas sur leur niveau actuel. Acheter du fixe = parier que les taux vont baisser.

# MODULE 5 — Repo, collateral & lending

### 🎯 Objectif

Comprendre **le plumbing du système financier**

### Concepts
- Repo = vente + rachat futur
- Haircut
- Collateral
- Rehypothecation
- Overnight vs term repo

### Pont DeFi

| TradFi | DeFi |
|---|---|
| Repo | Lending collatéralisé |
| Haircut | LTV |
| Rehypothecation | Recursive lending |
| OIS rate | Base lending rate |

# MODULE 5b — Crédit & CDS

> Le crédit est au cœur de la finance — et le lending DeFi EST du crédit. Ce module est indispensable pour un futur curator Morpho.

### 🎯 Objectif

Comprendre **le risque de crédit** et ses instruments de transfert

### Partie 1 : Le risque de crédit
- **Définition** : risque qu'une contrepartie ne rembourse pas sa dette
- **PD (Probability of Default)** — probabilité de défaut
- **LGD (Loss Given Default)** — perte en cas de défaut (1 - taux de recouvrement)
- **EAD (Exposure at Default)** — montant exposé au moment du défaut
- **Expected Loss** = PD × LGD × EAD

### Partie 2 : Les ratings
- **AAA** : Qualité maximale (~0.01% PD annuelle)
- **BBB** : Investment grade (limite) (~0.20% PD)
- **BB et moins** : High yield / Junk (1-15% PD)
- Agences : Moody's, S&P, Fitch

### Partie 3 : Le spread de crédit
- **Spread** = rendement corporate - rendement État (même maturité)
- Le spread rémunère le risque de crédit
- Spread = f(PD, LGD, liquidité, prime de risque)

### Partie 4 : Le CDS [Credit Default Swap]
- **CDS** = assurance contre le défaut d'un émetteur
- **Acheteur de protection** : paie une prime périodique
- **Vendeur de protection** : paie le notionnel si défaut
- CDS spread ≈ spread de crédit (en première approximation)

### Partie 5 : Corrélation de défaut
- Les défauts ne sont pas indépendants
- En crise, beaucoup d'entreprises font défaut ensemble
- C'est ce qui a causé la crise de 2008 (corrélation sous-estimée dans les CDO)

### Pont DeFi
- PD → Pas de défaut en DeFi, mais **liquidation automatique**
- LGD → **Bad debt** si liquidation échoue
- Rating → Pas d'agence, **le collatéral fait foi**
- Corrélation de défaut → **Corrélation des collatéraux** (tous les LST dépendent d'ETH)

> Insight curator : En DeFi, il n'y a pas de défaut au sens TradFi — il y a des liquidations. Un curator doit penser comme un credit risk manager, pas comme un trader.

# MODULE 6 — Futures, forwards & stratégies delta-neutral

### 🎯 Objectif

Comprendre **les bases des arbitrages directionnels neutres**

### Concepts
- Forward vs future
- Cost of carry
- Contango / backwardation
- Basis
- Funding rate (analogue TradFi)

### Stratégies
- Spot + future
- Cash and carry
- Calendar spread

### Pont DeFi
- Perp funding = **carry**
- Arbitrage perp ↔ spot
- Vault delta-neutral = hedge fund classique

# MODULE 7 — Market making & microstructure

### 🎯 Objectif

Comprendre **comment les prix se forment**

### Concepts
- Bid / Ask
- Spread
- Inventory risk
- Adverse selection
- Order book vs quote-driven

### Pont DeFi

| TradFi | DeFi |
|---|---|
| Market maker | LP |
| Spread | Fees |
| Inventory risk | IL |
| Order book | CLOB DEX |

# MODULE 8 — Options : payoffs & pricing intuitif

### 🎯 Objectif

Savoir **lire un payoff** et comprendre les risques

### Concepts
- Call / Put
- Moneyness
- Payoff vs PnL
- Greeks (delta, gamma, theta)
- Vol implicite

### Pont DeFi
- Options = **NFT de payoff**
- Vaults options = stratégies structurées
- Theta = yield temporel

### Enrichissement : Pricing quantitatif

**Le modèle binomial (Cox-Ross-Rubinstein)**
- Arbre binomial : À chaque pas, le sous-jacent monte (u) ou descend (d)
- Probabilité risque-neutre : p = (e^(rΔt) - d) / (u - d)
- Backward induction : On remonte l'arbre en actualisant les payoffs
- Avantage : Intuitif, gère les options américaines (exercice anticipé)

**Black-Scholes-Merton (1973)**
- Hypothèses : Prix suit un mouvement brownien géométrique, vol constante, pas de dividendes, taux sans risque constant
- Formule Call : C = S·N(d₁) - K·e^(-rT)·N(d₂)
- où d₁ = [ln(S/K) + (r + σ²/2)T] / (σ√T) et d₂ = d₁ - σ√T
- Parité Put-Call : C - P = S - K·e^(-rT)

**Les Greeks**
- Delta (Δ) : Sensibilité au prix du sous-jacent (∂C/∂S)
- Gamma (Γ) : Sensibilité du delta au prix (∂²C/∂S²)
- Theta (Θ) : Decay temporel (∂C/∂t) — toujours négatif pour les options longues
- Vega (ν) : Sensibilité à la volatilité (∂C/∂σ)
- Rho (ρ) : Sensibilité au taux (∂C/∂r)

> Pont DeFi : Les protocoles d'options crypto (Lyra, Dopex) utilisent Black-Scholes adapté. La vol implicite on-chain (DVOL) remplace le VIX.

# MODULE 8b — Volatilité

> La volatilité est le paramètre le plus important en pricing d'options. Elle mérite son propre module.

### 🎯 Objectif

Maîtriser **la volatilité sous toutes ses formes** : historique, implicite, smile, surface

### Partie 1 : Vol historique vs implicite
- **Vol historique** = vol passée, mesurée sur les rendements (écart-type annualisé)
- **Vol implicite** = vol future anticipée, extraite des prix d'options via Black-Scholes inverse

### Partie 2 : Le smile de volatilité
- Observation : la vol implicite n'est PAS constante selon le strike
- **Smile** : vol plus haute aux extrêmes (symétrique)
- **Skew** : vol plus haute pour les puts OTM (asymétrique, typique actions)
- Pourquoi ? B-S sous-estime les crashes, les investisseurs paient plus cher pour se protéger

### Partie 3 : Surface de volatilité
- Le smile existe pour CHAQUE maturité
- **Surface de vol** = smile en fonction du strike ET de la maturité
- Skew plus prononcé pour les maturités courtes

### Partie 4 : Vol réalisée vs implicite
- **Variance Risk Premium** = Vol implicite - Vol réalisée (en moyenne > 0)
- Si Vol implicite > Vol réalisée attendue → vendre des options
- C'est ce que font les covered call vaults : vendre la vol

### Partie 5 : Indices de volatilité
- **VIX** = indice de la peur (vol implicite S&P 500 à 30 jours)
- VIX > 30 = marché stressé ; VIX < 15 = marché complaisant
- **DVOL** (Deribit) = vol implicite BTC/ETH (typiquement 50-80%)

### Pont DeFi
- VIX → DVOL (Deribit), IV sur Lyra/Premia
- Vendre la vol → Covered call vaults (Ribbon, Thetanuts)
- Skew prononcé en crypto (crashes fréquents)

> Insight : En crypto, la vol implicite est structurellement élevée (50-100% vs 15-25% en equity). Les rendements des option vaults viennent de la vente de volatilité — c'est du risque, pas du rendement gratuit.

# MODULE 9 — Théorie de portefeuille [Markowitz]

### 🎯 Objectif

Comprendre **pourquoi la diversification fonctionne**

### Concepts
- Espérance / variance
- Corrélation
- Frontière efficiente
- Risk-free asset
- Sharpe ratio

### Pont DeFi
- Portfolio vaults
- Risk-parity
- Cross-chain diversification
- Stablecoins = pseudo risk-free

### Enrichissement : CAPM & Mesures de performance

**Capital Asset Pricing Model (CAPM)**
- Équation fondamentale : E[Rᵢ] = Rf + βᵢ × (E[Rm] - Rf)
- Rf = taux sans risque, Rm = rendement du marché
- Seul le risque systématique (non diversifiable) est rémunéré

**Beta (β) — Sensibilité au marché**
- β = Cov(Rᵢ, Rm) / Var(Rm)
- β = 1 : Suit le marché | β > 1 : Plus volatile | β < 1 : Défensif
- En crypto : ETH souvent β ≈ 1.2-1.5 vs BTC

**Alpha (α) — Surperformance**
- α = Rᵢ - [Rf + β × (Rm - Rf)]
- α > 0 : Le gérant bat le marché ajusté du risque
- En DeFi : Alpha = yield au-delà du risk-free (staking ETH ≈ 3-4%)

**Ratios de performance**
- Sharpe Ratio : (Rp - Rf) / σp — Rendement excédentaire par unité de risque total
- Sortino Ratio : (Rp - Rf) / σdownside — Ne pénalise que la volatilité baissière
- Treynor Ratio : (Rp - Rf) / β — Rendement excédentaire par unité de risque systématique
- Information Ratio : α / σ(tracking error) — Alpha par unité d'écart au benchmark

**Extension : Modèle Fama-French**
- 3 facteurs : Marché + SMB (Small minus Big) + HML (High minus Low book-to-market)
- 5 facteurs : + RMW (Profitability) + CMA (Investment)
- Explique mieux les rendements que le CAPM seul

> Pont DeFi : En DeFi, on parle de yield farming alpha quand un vault surperforme le staking simple. Les curators Morpho cherchent l'alpha via une meilleure sélection de marchés et allocation.

# MODULE 10 — Produits structurés & ingénierie financière

### 🎯 Objectif

Assembler des briques simples pour créer des produits complexes

### Concepts
- Capital protected notes
- Autocallables
- Reverse convertibles
- Coupons conditionnels

### Pont DeFi
- Structured vaults
- Pendle + options
- Auto-compounding strategies

# MODULE 11 — Risk management & stress

### 🎯 Objectif

Penser comme un risk manager

### Concepts
- VaR / CVaR
- Stress tests
- Liquidité
- Wrong-way risk
- Model risk

### Pont DeFi
- Depeg
- Oracle risk
- Smart contract risk
- Liquidity cliff

# MODULE 11b — Clearing & Collatéralisation

> Module optionnel mais utile pour comprendre ce que la DeFi remplace — et ce qu'elle ne remplace pas.

### 🎯 Objectif

Comprendre **l'infrastructure post-trade TradFi** et pourquoi la DeFi est une rupture

### Partie 1 : Le risque de contrepartie
- T+0 : trade exécuté ; T+2 : settlement (livraison vs paiement)
- Risque : entre T+0 et settlement, une partie peut faire défaut

### Partie 2 : Les CCP [Chambres de Compensation]
- **CCP** = contrepartie centrale qui s'interpose entre A et B (novation)
- Avantages : mutualisation du risque, netting, standardisation
- Exemples : LCH, CME Clearing, Eurex Clearing

### Partie 3 : Le système de margin
- **Initial Margin (IM)** : collatéral déposé à l'ouverture
- **Variation Margin (VM)** : ajustements quotidiens (mark-to-market)
- **Margin call** : si collatéral < seuil, obligation de remettre du cash

### Partie 4 : Collatéral et haircuts
- Collatéral accepté : Cash > Obligations État > Corporate IG > Actions
- **Haircut** = décote appliquée (ex: action volatile → haircut 20-40%)

### Pont DeFi
- CCP → **Smart contract** (pas de contrepartie, code = loi)
- T+2 settlement → **Settlement instantané** (même bloc)
- Margin call → **Liquidation automatique** (pas d'appel)
- Haircut → LTV ratio (ex: 80% LTV = 20% haircut)

### Ce que la DeFi améliore
- Settlement T+2 → T+0 (atomique)
- Opacité → Transparence (tout on-chain)
- Accès réservé → Permissionless
- 9h-17h → 24/7/365

### Ce que la DeFi ne résout pas
- Oracle risk (pas d'équivalent TradFi)
- Smart contract risk (bugs = pertes)
- Liquidation spirals
- Pas de recours (pas de tribunal, pas de bail-out)

> Insight : La DeFi n'élimine pas le risque — elle le transforme. Le risque de contrepartie devient smart contract risk. Le margin call devient liquidation. La CCP est remplacée par... personne.

# MODULE 12 — Synthèse TradFi ↔ DeFi

### Exercices mentaux
- Recréer Pendle en TradFi
- Recréer un autocall en DeFi
- Recréer un ETF avec des smart contracts
- Lire un whitepaper DeFi comme un term sheet
