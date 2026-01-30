# DeFI

> 💡 Base de connaissance des protocoles DeFi analysés. Chaque entrée documente le protocole, son fonctionnement, ses risques, et son potentiel pour Blue Dolphin.

## DeFi Protocols

| Protocole | Token | TVL ($B) | MCap ($M) | Type | Category | Chain |
|-----------|-------|----------|-----------|------|----------|-------|
| [**Aave**](./Protocols/Aave.md) | AAVE | 33.2 | 2050 | Lending/Borrowing | SBM Infrastructure | Multi-chain |
| [**Morpho**](./Protocols/Morpho.md) | MORPHO | 5.6 | 538 | Lending/Borrowing | Vault Infrastructure | Multi-chain |
| [**Lido**](./Protocols/Lido.md) | LDO | 25.9 | 430 | Staking | LST | Ethereum |
| [**justLend**](./Protocols/justLend.md) | JUST | 3.8 | 340 | Lending/Borrowing | SBM Infrastructure | Tron |
| [**Maple**](./Protocols/Maple.md) | SYRUP | 2.6 | 383 | KYC Borrowing | Onchain AM | Ethereum |
| [**Sparklend**](./Protocols/Sparklend.md) | SPK | 3.6 | 44 | Lending/Borrowing | Onchain AM | Ethereum, Gnosis |
| [**Kamino**](./Protocols/Kamino.md) | KMNO | 2.4 | 270 | Lending/Borrowing | - | Solana |
| [**Euler**](./Protocols/Euler.md) | EUL | 1.0 | 56 | Lending/Borrowing | Vault Infrastructure | Multi-chain |

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
