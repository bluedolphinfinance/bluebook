# DeFI

> 💡 Base de connaissance des protocoles DeFi analysés. Chaque entrée documente le protocole, son fonctionnement, ses risques, et son potentiel pour Blue Dolphin.

## DeFi Protocols

| Protocole | Category | Chain | TVL ($B) | Type | Token | MCap ($M) | Risk | BD Interest | Yield | Audit |
|-----------|----------|-------|----------|------|-------|-----------|------|-------------|-------|-------|
| [**Aave**](./Protocols/Aave.md) | SBM Infrastructure | Multi-chain | 33.2 | Lending/Borrowing | AAVE | 2050 | Tier I | Low | Overcollateralized | NR |
| [**Morpho**](./Protocols/Morpho.md) | Vault Infrastructure | Multi-chain | 5.6 | Lending/Borrowing | MORPHO | 538 | - | High | Overcollateralized | NR |
| [**Lido**](./Protocols/Lido.md) | LST | Ethereum | 25.9 | Staking | LDO | 430 | - | Low | PoS | NR |
| [**justLend**](./Protocols/justLend.md) | SBM Infrastructure | Tron | 3.8 | Lending/Borrowing | JUST | 340 | - | Low | Overcollateralized | NR |
| [**Maple**](./Protocols/Maple.md) | Onchain AM | Ethereum | 2.6 | KYC Borrowing | SYRUP | 383 | Tier II | Low | Overcollateralized, Platforms | Audited |
| [**Sparklend**](./Protocols/Sparklend.md) | Onchain AM | Ethereum, Gnosis | 3.6 | Lending/Borrowing | SPK | 44 | - | Medium | Overcollateralized | NR |
| [**Kamino**](./Protocols/Kamino.md) | - | Solana | 2.4 | Lending/Borrowing | KMNO | 270 | - | High | Overcollateralized | NR |
| [**Euler**](./Protocols/Euler.md) | Vault Infrastructure | Multi-chain | 1.0 | Lending/Borrowing | EUL | 56 | Tier II | Medium | Overcollateralized | NR |

---

## Laïus

L'essentiel de la **finance décentralisée (DeFi)** s'est historiquement structuré et demeure aujourd'hui concentré sur **Ethereum** (mainnet) et son écosystème de **solutions de couche 2 (L2)**.

Ethereum a été la première blockchain à offrir un environnement de **smart contracts** suffisamment expressif, sécurisé et standardisé pour permettre l'émergence de protocoles financiers complexes (DEX, lending, dérivés, stablecoins).

Il existe de la DeFi sur d'autres protocoles (Solana, Sui, Tron...) mais l'essentiel du capital se trouve sur Ethereum (L1 & L2).

🔗 https://defillama.com/protocols/lending

### Modèle de taux

Modèle forfaitaire (avec taux APY excessif si usage > 80% ; APY ~265% si utilisation ~100%)

IR jumping model

### Reserve factor

En **DeFi**, le **reserve factor** est un **paramètre de risque** qui détermine la **part des intérêts payés par les emprunteurs qui est conservée par le protocole**, plutôt que distribuée aux fournisseurs de liquidité.

Le reserve factor fixe le pourcentage alloué aux **réserves**.

**Rôles principaux**
- Sécurité : constitution d'un buffer contre les pertes (liquidations insuffisantes, bad debt)
- Durabilité : financement de la maintenance, audits, développement
- Gouvernance : parfois redistribué via staking ou trésorerie DAO

**Effet économique**
- Plus le reserve factor est élevé → rendement LP plus faible, protocole plus robuste
- Plus il est faible → rendement LP plus élevé, mais moins de protection

---

## 🚀 Prochaines étapes (To Do)

- Benchmark : Étudier Midas et Fluid pour comparer les rendements et la transparence
- Investigation : Localiser et auditer les Permission Pools (accessibilité et volume)
- Analyse technique : Organiser un échange avec CD pour le reverse engineering du protocole (flux de fonds réels)

## 🛠️ Guide de Reverse Engineering : Session avec CD

*À documenter*
