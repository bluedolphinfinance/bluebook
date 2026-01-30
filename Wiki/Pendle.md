# Pendle

![](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9bbef7e-20a5-8131-8370-0003e8a9cfec/906fe5b7-933a-4492-9e3d-0eb03158e721/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666HSXQHIV%2F20260129%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260129T221041Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCNGpY2kM2AwbCQrEUOdv5%2FUXtPc1o2%2F1GkuBMBV%2Ba8lgIhAMx8gmV7FHfoovXYlIE80Bpx4TLOHiuWOJBL3P9EyCDhKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzYsJa1JvzkFOZdll4q3ANuuRjubBxWzqIXBPuzkUW2HqOrjvDLVZCREE0fnAnxwIQVdCgVFa4kip3QLV%2Bdx3VQIuFHpSKunXkLbQ0oOeso3GQfay7kgbX3pdD1UYLAQMR2FfX8wkdSQQs0KunoKW6PzQA%2FTkbTk6RtRHarm8lV53y1XhKAb5nPr1bdtxTSCXE6Psm6XSzYiV9X9T4vrI9r%2F%2BBZBsEVl%2B1zo40QhGbGmEZTdI03H3EumTYQmrOI5ror%2FGxxXQz6hZ5keC%2FA%2Bj29Nlju%2B4jLGVthclV3HsE7Wdt4WrbBGJOfearEHFtN2VmscqV63eXLFDmr2wvnbyVItspXQ%2FksnQ8orOrLEKntTOA2eVrIGzozV3qc7T32Xcy%2BarewN96v9euhTzDjvD7w78LT5pBoKDOAi5qLjkPAXnNdPWQPUNByH3BX%2BJNrXPWZ%2BClW4zOjxb55dlUrrGx185u52pfKNkCdEi1TPzL6cvZa00iRrZm5krU06PD1zXtF38TYeMUcSm95rDqpmXjWVNIZxMwSlEwB7aOKdukE7PRpgQaqz3W1LLDV1K%2FJ%2FzJdfZj7JreLu03ckpZCCw1JfKEwRZHaA%2B2MMDwDEmbGAQhd%2FJhZ2gBce5MMd6DpHds0pDl%2BFLHqTIx6PDDtl%2B%2FLBjqkAd37fFFVBaPrdRLsvv7uGeBTDf%2F9K7gKtf3bOE0EIt9OuDmDlbuoHWWPBPv9Scsldyeb%2FdiP9z6Yo1ZatQY%2FeA%2Bb4y0Ougy1nnN6x1OP7nAqsgBHG1ODKe6tofuiPTNwgFGghKRPeLjIx4Tc%2Fkg%2FVarKkj8ALQvA%2FWNlkpCwrUT2HPCergZfD0DZM9EfM2REuZeg0%2F92HEk6gBmejN6HQknvC85u&X-Amz-Signature=dda0a6a13281587b598bf611437c8084deab872ace0ce53a5063a73de26cfebe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

# 1. Introduction (Sept 2021)

Pendle fonctionne comme un protocole innovant pour la tokenisation et le trading du rendement futur. 

Pendle répond à un besoin critique dans la DeFi : permettre aux utilisateurs de gérer, spéculer et se couvrir contre la volatilité des rendements de leurs actifs productifs.

En DeFi, les rendements des actifs tels que:

- les tokens de staking liquide (stETH de Lido), 
- les positions de lending (aUSDC d'Aave),
- ou les stratégies de yield farming (y compris farming de points/airdrops)
fluctuent en permanence, d’où la difficulté pour estimer une rentabilité à terme.

Les utilisateurs font face à plusieurs défis :

- Volatilité : impossibilité de prévoir les rendements futurs
- Absence de taux fixe : contrairement aux obligations traditionnelles, pas de taux garanti
- Exposition non modulable : impossible de séparer exposition au principal et exposition au rendement
Pendle révolutionne cette approche en créant un marché pour les rendements futurs, similaire aux dérivés de taux d'intérêt en TradFi.

# 2. Architecture technique

L'architecture de Pendle repose sur trois composants essentiels :

### 2.1 Standardized Yield (SY) Tokens

**Fonction du SY Token :**

- Wrapper unifié : enveloppe standardisée pour tous types d'actifs productifs
- Abstraction des mécanismes : simplifie trois types de génération de rendement
  
- Rebase tokens (stETH) : où le solde augmente automatiquement
  
- Accumulate tokens (cTokens de Compound) : où le taux de change augmente
  
- Distribute tokens (tokens générant des récompenses externes)
**Exemple :**

ETH ⇒ stETH (Lido) ⇒ SY-wstETH (Pendle)

100 ETH stakés ⇒ 100 SY-wstETH

Le SY token capture automatiquement le rendement natif de l'actif sous-jacent, qui sera ensuite distribué aux détenteurs de YT.

### 2.2 Principal Token (PT)

Le Principal Token représente la portion principale d'un actif productif de rendement après séparation du rendement.

**Caractéristiques du PT :**

- Valeur : se négocie à décote avant maturité
- Convergence à la parité : prix ⇒ valeur sous-jacente quand maturité approche
- Rachat à maturité : échangeable 1:1 contre l'actif comptable
- Équivalent TradFi : obligation zéro-coupon
**Exemple de prix :**

Si PT-wstETH (maturité 1 an) se traite à 0.95 ETH

Rendement fixe implicite = (1 - 0.95) / 0.95 ~ 5.26% APY

### 2.3 Yield Token (YT)

Le Yield Token représente la composante de rendement d'un actif sous-jacent productif. En détenant des YT, le rendement de l'actif sous-jacent est distribué aux utilisateurs jusqu'à maturité.

**Propriétés du YT :**

- Décroissance temporelle : valeur ⇒ 0 à l'approche de la maturité
- Capture du rendement : accumule tous les gains jusqu'à expiration
- Effet de levier : exposition au rendement sans capital principal total
- Distribution continue : rendement récupérable à tout moment
**Mécanique :**

Achat de 10 YT-wstETH à 0.05 ETH (total : 0.5 ETH, APY estimé 5% à l’achat)

Si rendement moyen réalisé = 6% sur 1 an

Rendement perçu = 10 × 0,06 = 0.6 ETH

Profit net = 0.6 (yield perçu) - 0.5 (coût des YT) = 0.10 ETH (gain de 20% sur montant investi, soit la hausse du yield)

### 2.4 La relation fondamentale

La somme en valeur dollar du PT et du YT doit être égale à l'actif sous-jacent car ce sont des parties individuelles d'un tout.

**Invariant mathématique :**

Valeur(SY) = Valeur(PT) + Valeur(YT)

Exemple : 1 SY-wstETH = 1 ETH

PT-wstETH = 0.95 ETH

YT-wstETH = 0.05 ETH

Total : 0.95 + 0.05 = 1 ETH

Cet invariant est maintenu par l'AMM de Pendle et l'arbitrage du marché.

# 3. Parallèles avec la TradFi

On retrouve des concepts assez classiques de la finance traditionnelle rendus possibles par Pendle :

### 3.1 Bond stripping et obligations zéro-coupon

Ce que fait Pendle est similaire au bond stripping en finance traditionnelle, où le principal et les intérêts des obligations sont séparés.

**STRIPS (Separate Trading of Registered Interest and Principal Securities) :**

Aux États-Unis, l'idée des STRIPS est que le principal et chaque paiement d'intérêt deviennent des titres séparés qui sont traités individuellement. Chaque flux séparé est un titre zéro-coupon qui arrive à maturité séparément.

**Exemple :**

Obligation US Treasury 10 ans, nominal $100,000, coupon 5%

⇒ Stripping en 21 titres distincts : 

- 20 paiements de coupon ($2,500 chacun, semestriels)
- 1 paiement principal ($100,000 à maturité) 
Chaque titre se négocie séparément comme un zéro-coupon

**Parallèle Pendle :**

100 wstETH (rendement 5%) 

⇒ 100 PT-wstETH (principal) + 100 YT-wstETH (rendements futurs)

**Caractéristiques communes :**

- Zero-coupon bonds = PT
  
- Pas de paiement périodique
  
- Achetés à décote
  
- Rachetables à maturité pour valeur nominale
- “Forward” sur rendement = YT
  
- Droit aux flux de revenus futurs
  
- Valeur décroissante temporellement
  
- Zéro à maturité
Le YT n’a pas de réel comparable en TradFi, c’est comme un droit sur le taux + un CFD sur le taux réalisé (je perçois les revenus + je m’expose à leur hausse)

### 3.2 Duration et sensibilité aux taux

Les obligations zéro-coupon ont une duration égale à la maturité de l'obligation, ce qui les rend sensibles à tout changement des taux d'intérêt.

La duration mesure la sensibilité du prix aux variations de taux.

PT-wstETH maturité 1 an : Duration ~ 1 an

Si taux ↑ 1% ⇒ prix PT ↓ ~1% 

Les PT, comme les zéro-coupons, ont une duration maximale pour leur maturité, donc sensibilité maximale aux mouvements de rendement.

### 3.3 Interest Rate Swaps (IRS)

Pendle crée un marché pour les dérivés de taux d'intérêt similaire aux IRS traditionnels.

**IRS traditionnel :**

A : paie taux fixe 3%

B : paie taux variable (SOFR) 

Sur notionnel $10M, échanges trimestriels, durée 5 ans

But : transformer exposition taux variable ↔ taux fixe

**Équivalent Pendle :**

A : achète PT (verrouille le rendement fixe)

B : achète YT (exposition au rendement variable) 

100 ETH en stETH : 

A achète 100 PT-wstETH à 95 ETH ⇒ rendement fixe ~5.26%

B achète 100 YT-wstETH à 5 ETH ⇒ rendement variable (staking APY)

A a swappé rendement variable stETH pour fixe 5.26%

B a acheté exposition au rendement variable

### 3.4 Courbe des taux

En TradFi, la courbe des taux montre le rendement des obligations selon leur maturité.

**Courbe des taux USD :**

| Maturité | Yield |
|----------|-------|
| 1y | 3.53% |
| 2y | 3.44% |
| 5y | 3.71% |
| 10y | 4.17% |

**Sur Pendle, différents pools PT avec maturités distinctes :**

| PT | Yield |
|----|-------|
| PT-USDe 23 days | 4.84% |
| PT-USDe 44 days | 4.98% |
| PT-USDe 107 days | 5.53% |

Cette structure permet :

- Arbitrage de courbe
- Gestion de duration
- Anticipation des taux

### 3.5 Produit structuré

On peut créer des produits structurés combinant PT et YT.

**Produit structuré TradFi à capital garanti :**

Investissement : $100,000

Allocation :

- $95,000 ⇒ obligation zéro-coupon 1Y 5% (principal garanti)
- $5,000 ⇒ options sur actions (upside potentiel)

Payoff à maturité :

- Minimum : $100,000 (protection principal)
- Maximum : $100,000 + gains options

**Produit structuré Pendle :**

100 ETH disponibles

Stratégie "protected upside" :

- Acheter 100 PT-wstETH pour 95 ETH (protège 100 ETH à maturité)
- Utiliser 5 ETH pour acheter YT-wstETH (exposition à levier sur le rendement)

Payoff :

- Minimum : 100 ETH garantis à maturité
- Maximum : 100 ETH + tous les rendements accumulés via YT (long yield)

# 4. Cas d'usage et Stratégies

### 4.1 Long Yield - pari directionnel sur le rendement

Profiter d'une hausse du rendement.

**Mise en œuvre :**

- Achat de YT
- Pas d'exposition directe au principal

**Mécanisme économique :**

Le YT concentre toute l'exposition au rendement. Il agit comme un dérivé de taux.

**Exemple :**

- YT-wstETH acheté à 0.05 ETH
- Rendement anticipé : 5%
- Rendement réalisé : 7%

→ Le surplus de rendement (2%) est intégralement capturé par le YT

**Risques :**

- Rendement inférieur aux attentes
- Time decay (θ négatif)
- Valeur → 0 à maturité

### 4.2 Yield Hedging - couverture du rendement

*Conditions initiales : LP détient l'actif*

Se protéger contre une baisse du rendement futur.

**Mise en œuvre :**

- Détenir le sous-jacent (stETH, USDe, aUSDC…)

**Résultat :**

- Rendement variable transformé en rendement fixe
- Neutralisation de la volatilité du yield

**Équivalent TradFi :**

Swap taux variable → taux fixe (IRS)

### 4.3 Fixed Income / Lock de rendement

*Conditions initiales : LP détient du cash*

Obtenir un rendement fixe garanti.

**Mise en œuvre :**

- Achat direct de PT
- Carry jusqu'à maturité

**Exemple :**

PT-USDe à 0.94 (maturité 6 mois)

→ Récupération de 1 USDe à maturité

→ Rendement annualisé déterministe

### 4.4 Arbitrage PT ↔ sous-jacent

Exploiter les inefficiences de prix entre :

- PT
- SY
- sous-jacent spot

**Arbitrage classique :**

Si PT + YT ≠ SY → arbitrage immédiat possible

**Arbitrage de convergence :**

- Achat PT décoté
- Attente maturité
- Conversion 1:1

### 4.5 Yield curve trading

Pendle permet une gestion de courbe de taux.

**Exemples :**

- Long PT court terme / short PT long terme
- Exploiter une courbe inversée
- Positionnement macro sur baisse ou hausse de rendement

→ Approche très proche des desks taux en TradFi

# 5. AMM

Pendle n'utilise pas un AMM constant-product classique (x*y = k).

### 5.1 Problème des AMM classiques

Les AMM type Uniswap sont inadaptés car :

- Les YT ont une décroissance temporelle
- Leur valeur tend vers 0 à maturité
- La fonction de prix doit intégrer le temps

Un AMM standard ne fonctionne pas par construction à maturité.

### 5.2 AMM à maturité (Time-decay aware)

Pendle utilise un AMM spécialisé avec :

- Une fonction de pricing asymétrique
- Un facteur temps explicite
- Une convergence forcée des prix

À maturité :

- Prix(YT) → 0
- Prix(PT) → valeur sous-jacente

Sans dépendre d'un oracle externe.

### 5.3 Rôle de l'arbitrage

L'AMM n'impose pas la parité seul.

Elle est maintenue par :

- Arbitragistes
- Liquidité concentrée (plages de prix)

Si PT + YT ≠ SY → opportunité de profit immédiate → retour à l'invariant

### 5.4 Liquidité et incentives

Les LP fournissent de la liquidité sur :

- PT ↔ SY
- YT ↔ SY

Ils gagnent :

- Frais de trading
- Incentives en PENDLE
- Boosts via vePENDLE

**Risques :** Le LPing sur YT est complexe : exposition au time decay + yield realized

# 6. Tokenomics - Gouvernance

Le token PENDLE gouverne le protocole.

### 6.1 PENDLE token

**Fonctions principales :**

- Gouvernance
- Incentives LP
- Boost de rendement

Pas un token de yield direct. Le rendement vient du protocole.

### 6.2 vePENDLE (vote-escrow)

Inspiré de Curve / Convex.

**Fonctionnement :**

- Lock PENDLE (jusqu'à 2 ans)
- Réception de vePENDLE non transférable

**Avantages :**

- Boost des rewards LP
- Part des fees du protocole
- Pouvoir de vote sur l'allocation des incentives

### 6.3 "Flywheel" économique

- Pendle liste de nouveaux actifs à yield attractif
- Les rendements attirent traders, LP et stratégies quant
- Plus de volume → plus de fees
- Les fees vont aux détenteurs de vePENDLE
- Pour capter ces fees, les utilisateurs lockent PENDLE
- Le lock réduit l'offre liquide
- Moins d'offre liquide + plus de demande stratégique
- Valeur du PENDLE ↑
- Le protocole devient encore plus attractif

Process "déflationniste" et "sticky" car sortir de vePENDLE coûte quelque chose

**Pour un LP :**

- Perte du boost
- Baisse du rendement
- Désavantage compétitif

**Pour un protocole tiers :**

- Perte d'influence sur l'allocation d'incentives
- Perte de liquidité

**Pour un investisseur long terme :**

- vePENDLE est non transférable
- le unlock est lent
- la sortie est coûteuse

### 6.4 Gouvernance

Les détenteurs de vePENDLE votent sur :

- Allocation des incentives par pool
- Paramètres AMM
- Intégration de nouveaux assets
- Évolutions du protocole

Favorise les acteurs long terme

# 7. Risques

- Risque de smart contract (Pendle + underlying)
- Risque d'oracle
- Risque de depeg
- Risque de yield plus faible que prévu si détenteur du YT
- Liquidité des pools
- Complexité mal maîtrisée

# 8. Docs et liens

🔗 https://docs.pendle.finance/

🔗 https://defillama.com/protocol/pendle

