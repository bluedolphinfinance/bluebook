# Les pools

---

# 1. Définition des principaux mécanismes d’échange

## CLOB – Central Limit Order Book

- Mécanisme traditionnel des marchés d’actions et futures.
- Livre d’ordres centralisé où acheteurs et vendeurs soumettent des ordres limit/market.
- Transparence : meilleure offre et meilleure demande visibles, profondeur publique.
- Exemples : Euronext, Nasdaq, Binance Spot.
- Avantages : transparence, efficacité prix.
- Limites : forte concurrence pour la latence, sensibilité au front-running dans les cryptos (MEV).
---

## RFQ – Request for Quote

- Modèle utilisé notamment en taux, crédit, dérivés OTC, FX.
- L’investisseur envoie une requête de prix à plusieurs dealers, reçoit des quotes, puis choisit la meilleure.
- Interaction bilatérale, anonymat partiel ou total.
- Avantages : exécution sur taille (block trades), moindre impact de marché.
- Limitations : moins de transparence, dépendance aux market-makers.
---

## RFS – Request for Stream

- Variante du RFQ dans les actifs très liquides.
- Le client reçoit un flux continu de prix (stream) sur lequel il peut “cliquer” pour exécuter.
- Plus rapide que le RFQ ; plus proche du trading électronique automatique.
- Utilisé en FX électronique, commodities, certains dérivés.
- Avantages : rapidité, quasi-automatisation.
- Limites : moins de profondeur sur grande taille que RFQ, dépendance à la qualité du stream.
---

### Différence synthétique RFQ vs RFS

| Critère | RFQ | RFS |
|---------|-----|-----|
| Mode | Requête ponctuelle | Flux continu |
| Vitesse | Plus lent | Plus rapide |
| Taille | Block trades, grande taille | Taille standard |
| Interaction | Bilatérale, plusieurs dealers | Clic sur stream |
| Usage | Taux, crédit, dérivés OTC | FX, commodities liquides |

---

## AMM – Automated Market Maker

- Mécanisme de prix emblématique de la DeFi.
- Les prix sont donnés par une fonction mathématique (ex. x*y = k d’Uniswap v2).
- Liquidité apportée par des liquidity providers dans des pools.
- Modèle sans carnet d’ordres, fondé sur l’arbitrage externe pour assurer l'efficience.
- Avantages : marché 24/7, permissionless, liquidité instantanée.
- Limites : impermanent loss, MEV, slippage, fragmentation des pools.
---

## Autres pools

- Proactive Market Makers (PMM) : ex. DODO, ciblent un prix “optimal” plus proche du marché que le simple AMM.
- Concentrated Liquidity Pools (CLMM) : ex. Uniswap v3 ; liquidité fournie par intervalles de prix.
- Hybrid Orderbooks + AMM : ex. dYdX v4, GMX v2.
- RFQ on-chain : 0x RFQ, Cowswap (intent-based).
- Order Flow Auctions / Solver-based 
---

# 2. Thème général de la conférence

L’arrivée des institutionnels recompose l’écosystème de la blockchain en modifiant les mécanismes d’échange. La conférence analyse donc :

1. Le rapprochement entre le fonctionnement des marchés financiers traditionnels (CLOB, RFQ, RFS)
  
→ standardisation, transparence accrue, montée des market-makers institutionnels.

1. L’évolution des mécanismes propres à la DeFi (AMM, liquidity pools)
  
→ recherche d’efficacité, réduction du slippage, montée des modèles hybrides.

1. L'impact de l’arrivée des institutionnels sur l’organisation des marchés crypto :
  
- professionnalisation de la liquidité,
  
- amélioration de la profondeur de marché,
  
- demande accrue de conformité,
  
- montée des infrastructures de staking institutionnel,
  
- standardisation des pratiques de trading et de gestion des risques.
1. La convergence progressive entre TradFi et DeFi
  
→ hybridation des modèles, intégration des RFQ on-chain, émergence des plateformes de tokenisation institutionnelle, et future coexistence entre CLOB, AMM et systèmes à base d’intentions (intent-based).

---

# 3. Note de lecture structurée

  
## Objet

  
Comprendre comment les différents mécanismes d’échange – CLOB, RFQ, RFS, AMM, pools – structurent les marchés financiers et crypto, et comment l’arrivée des institutionnels transforme cette architecture.

  
## Points clés

  
### 1. Dualité CLOB vs AMM

  
- Le CLOB reste supérieur pour les actifs très liquides et les tailles importantes.
  
- L’AMM excelle dans les marchés naissants, fragmentés, où la liquidité est décentralisée.
  
- Les institutionnels poussent vers des modèles hybrides, cherchant à réduire l’impermanent loss et le coût du capital.
  
### 2. RFQ/RFS : bilatéralité vs streaming

  
- RFQ = transaction de gré à gré optimisée, adaptée aux blocs.
  
- RFS = version électronique pour actifs très liquides.
  
- Ces modèles migrent vers la blockchain via 0x, Cowswap, Hashflow.
  
### 3. Montée des modèles “intent-based”

  
- L’utilisateur exprime une intention (swap X contre Y).
  
- Des solveurs s’occupent d’exécuter de manière optimale.
  
- Réduction du MEV, meilleure expérience utilisateur.
  
### 4. Institutionnalisation de la liquidité

  
- Staking institutionnel (Kiln, Meria).
  
- Fonds tokenisés (Spiko, autres initiatives money-market).
  
- Plateformes de prêts DéFi institutionnelles (Morpho).
  
- VC Web3 early-stage structurés.
  
### 5. Conséquences macro

  
- Plus de professionnalisation : gestion du risque, conformité, pricing plus fin.
  
- Plus d’interopérabilité : ponts entre CLOB off-chain et pools on-chain.
  
- Réduction de la dispersion des prix grâce aux arbitrages institutionnels.
  
- Vers un marché crypto plus proche de la microstructure financière classique.
---

# 4. Conclusion

  
La conférence explore la microstructure comparée des marchés TradFi et DeFi. L’arrivée des institutionnels accélère une convergence structurelle :

  
- Le CLOB apporte transparence et profondeur.
  
- Le RFQ/RFS apporte exécution sur taille.
  
- L’AMM apporte ouverture et automatisation.
  
Les marchés crypto entrent dans une phase de maturité, caractérisée par :

  
- l'hybridation des modèles,
  
- la réduction du risque de liquidité,
  
- et la montée des infrastructures institutionnelles (staking, tokenisation, decentralised credit).
---





