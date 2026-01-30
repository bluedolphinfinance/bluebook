# Steakhouse (Jan 13)

Revue le 13-01-26

---

## Issues

**(1)** Pour les TVL, il n'interroge pas forcément les dernières data (lui demander de prendre comme golden source DeFi Llama)
- La source actuelle est "**Data Source**: DeFiLlama + Academic research"
- Enlever Academic research et forcer DEFILLAMA en lien temps réel (les valeurs du jour)

**(2)** Competitive position - les taux ne semblent pas à jour

**(3)** **"All Documented Vaults" → Non, ce ne sont que les vaults Mainnet et Base (pas ARB d'ailleurs où les PFees sont à zéro). Le plus gros fonds a un perf fees à 25% non mentionné dans le GitHub**
- 🔗 https://app.morpho.org/ethereum/curator/steakhouse-financial
- Par ailleurs dans "product vault", l'adresse des vaults mentionnés n'est pas fournie (malgré ma demande précédente)

---

## Notes

Academic research confirms Steakhouse exhibits near-zero drawdown correlation (0.09-0.25) with aggressive competitors, effectively functioning as a "cash-management facility" rather than a yield-amplifying node.

Steakhouse Financial maintains a modest GitHub presence with 20 public repositories, primarily focused on oracle contracts and analysis tools.

Steakhouse/Smokehouse - ça fait degen (Prime IG/High Yield)

**Collateral Exclusions:**
- No algorithmic stablecoins (e.g., xUSD - proved correct)
- No long-tail tokens
- No governance tokens as collateral
- No yield-bearing tokens with unproven peg
