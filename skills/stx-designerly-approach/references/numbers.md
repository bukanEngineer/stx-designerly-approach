# Balance Display Rules

Simple formatting rules for showing fiat, stablecoin, and token balances across StraitsX product surfaces.

## Where to look

| Question | Section |
|---|---|
| Overview, exact or full precision | 1, 3, 5, 6 |
| Currency code and symbol placement | 2 |
| Avoiding overstated balances, sub-cent values, rounding | 4, 7, 8 |
| Tokens and stablecoins | 9, 15 |
| Where each format applies, revealing exact values, copying | 10, 11, 12 |
| Edge cases and negative values | 13, 14 |
| Formatting hygiene, shared formatter helper and tests | 16, 17 |


## 1. Main principle

Use three display types:

| Type               | Use when                                        | Example                            |
| ------------------ | ----------------------------------------------- | ---------------------------------- |
| **Simplified**     | User is scanning overview information           | `10K USD`, `100K USD`, `1.24M USD` |
| **Exact**          | User needs to verify, reconcile, or act         | `12,547.32 USD`                    |
| **Full precision** | Receipt, audit, on-chain, or transaction detail | `12,547.328291 XUSD`               |

Overview pages can use simplified values.

Working pages must use exact or full-precision values.

## 2. Currency format

Currency or token code goes **after** the number.

```md
1,232 USD
12.54K XUSD
0.005412 BTC
```

Do not use:

```md
$1,232
S$1,232
USD 1,232
```

## 3. Simplified display rules

Use simplified display for overview surfaces and secondary monetary information.

Secondary monetary information means a value that supports the main balance or gives extra context, but is not the primary value the user is acting on.

Examples include daily limit, spendable balance, remaining limit, used limit, pending amount summary, and dashboard summary values.

When simplified display is used, the exact value must be available through hover, long-press, tooltip, focus state, or detail view.

For abbreviated values using `K`, `M`, or `B`:

* Show **up to 2 decimals**
* Drop trailing zeros
* Drop the decimal point if the decimals become `.00`
* Use uppercase `K`, `M`, `B`
* Do not promote user balances to the next unit before the real threshold

Values from `1,000` to `9,999.99` do not use `K` abbreviation; they show the full number and drop cents.

|          Raw value | Simplified display |
| -----------------: | -----------------: |
|                `0` |            `0 USD` |
|           `< 0.01` |       `< 0.01 USD` |
|             `0.42` |         `0.42 USD` |
|           `500.00` |          `500 USD` |
|           `500.10` |       `500.10 USD` |
|         `1,232.42` |        `1,232 USD` |
|        `10,000.00` |          `10K USD` |
|        `10,500.00` |        `10.5K USD` |
|        `10,540.00` |       `10.54K USD` |
|        `10,547.32` |       `10.54K USD` |
|       `100,000.00` |         `100K USD` |
|       `100,500.00` |       `100.5K USD` |
|       `248,910.05` |      `248.91K USD` |
|       `999,999.99` |      `999.99K USD` |
|     `1,000,000.00` |           `1M USD` |
|     `1,200,000.00` |         `1.2M USD` |
|     `1,247,893.42` |        `1.24M USD` |
| `1,000,000,000.00` |           `1B USD` |
| `1,240,000,000.00` |        `1.24B USD` |

## 4. Important: do not overstate balances

For user balances, do **not** promote to the next unit before the real threshold.

Correct:

```md
999,999 USD      → 999.99K USD
999,999.99 USD   → 999.99K USD
1,000,000 USD    → 1M USD
```

Incorrect:

```md
999,999 USD → 1M USD
```

The user does not actually have `1M USD`.

## 5. Exact display rules

Use exact display when the user needs to verify or act.

Use exact display for:

* Asset rows
* Transaction history
* Statements
* Reconciliation pages
* Send / swap / withdraw input
* Confirmation screen

|      Raw value |      Exact display |
| -------------: | -----------------: |
|            `0` |         `0.00 USD` |
|         `0.42` |         `0.42 USD` |
|          `500` |       `500.00 USD` |
|     `1,232.42` |     `1,232.42 USD` |
|       `10,000` |    `10,000.00 USD` |
|      `100,000` |   `100,000.00 USD` |
| `1,247,893.42` | `1,247,893.42 USD` |

Exact fiat and stablecoin values should keep 2 decimals.

```md
10.00 USD
1,232.00 XUSD
248,910.50 SGD
```

## 6. Full precision rules

Use full precision when the exact raw value matters.

Use full precision for:

* Receipt
* Transaction detail
* Audit view
* On-chain record
* Settlement view

Examples:

```md
1,247.503829 XUSD
0.00001234 ETH
0.0042 USD
1.34218
```

## 7. Sub-cent values

Never show a real non-zero value as `0.00`.

| Context           |      Display |
| ----------------- | -----------: |
| Overview          | `< 0.01 USD` |
| Fee               | `0.0042 USD` |
| Transaction input | `0.0042 USD` |
| Confirmation      | `0.0042 USD` |
| Receipt / audit   | `0.0042 USD` |

## 8. Rounding rules

Always calculate using raw full precision.

Only round or truncate when displaying.

| Context                | Rule                  |                      Example |
| ---------------------- | --------------------- | ---------------------------: |
| User balance           | Truncate down         |     `12,547.32 → 12.54K USD` |
| Amount user receives   | Round down            | `15,000.567 → 15,000.56 USD` |
| Fee user pays          | Round up              |         `12.341 → 12.35 USD` |
| Exchange rate          | Show extra precision  |                    `1.34218` |
| Aggregate stat         | Normal rounding       |     `12,547.32 → 12.55K USD` |
| Chart axis / marketing | Rounded approximation |           `12,547 → 13K USD` |

Balance display should never show more than the user actually has.

Fee display should never show less than the user may pay.

## 9. Token rules

Tokens use more precision than fiat.

| Type                          |             Display |
| ----------------------------- | ------------------: |
| Stablecoin balance            |     `1,232.00 XUSD` |
| Stablecoin transaction detail | `1,247.503829 XUSD` |
| Token ≥ 1 unit                |        `1.2345 ETH` |
| Token < 1 unit                |      `0.005412 BTC` |
| Very small token balance      |    `0.00001234 ETH` |
| Fiat equivalent               |      `1,247.50 USD` |

Do not truncate token balances to zero.

## 10. Surface rules

| Surface                      | Display type               |
| ---------------------------- | -------------------------- |
| Wallet hero balance          | Simplified                 |
| Dashboard card               | Simplified                 |
| Stat block                   | Simplified                 |
| Chart axis                   | Simplified                 |
| Chart tooltip                | Exact                      |
| Asset row                    | Exact                      |
| Transaction history          | Exact                      |
| Statement                    | Exact                      |
| Reconciliation view          | Exact                      |
| Send / swap / withdraw input | Exact                      |
| Confirmation screen          | Exact                      |
| Receipt                      | Full precision when needed |
| Transaction detail           | Full precision when needed |
| Secondary monetary information | Simplified, exact on hover / long-press |

## 11. Exact value reveal

When simplified value is shown, the exact value must be accessible.

| Platform         | Interaction                                                 |
| ---------------- | ----------------------------------------------------------- |
| Desktop          | Hover                                                       |
| Mobile           | Long press / tap-and-hold                                   |
| Accessibility    | Screen reader should read exact value                       |
| Non-hover access | Exact value should also exist in detail view or focus state |

Example:

```md
Displayed: 12.54K USD
Reveal:    12,547.32 USD
```

## 12. Copy behavior

If the value is copyable, copy the exact or full-precision value.

```md
Displayed: 12.54K USD
Copied:    12,547.32 USD
```

Do not copy the shortened value.

## 13. Edge cases

| State               |                                       Display |
| ------------------- | --------------------------------------------: |
| Loading             |                                      Skeleton |
| Hidden balance      |                                  `•••••• USD` |
| Zero, simplified    |                                       `0 USD` |
| Zero, exact         |                                    `0.00 USD` |
| Error / unavailable |                                           `—` |
| Pending             | Show full readable amount + pending indicator |

Do not use `0.00 USD` for loading, error, or unavailable states.

## 14. Negative values

Apply formatting to the absolute value, then add the minus sign.

|     Raw value |    Simplified |             Exact |
| ------------: | ------------: | ----------------: |
|     `-847.23` | `-847.23 USD` |     `-847.23 USD` |
|   `-1,247.50` |  `-1,247 USD` |   `-1,247.50 USD` |
|  `-12,547.32` | `-12.54K USD` |  `-12,547.32 USD` |
| `-100,000.00` |   `-100K USD` | `-100,000.00 USD` |

Do not use accounting parentheses.

Correct:

```md
-1,247.50 USD
```

Incorrect:

```md
(1,247.50 USD)
```

## 15. Stablecoin peg rule

Do not make rounding look like peg slippage.

Wrong:

```md
Deposit: 10,000.00 USD
Credit:  9,990.00 XUSD
```

Right:

```md
Deposit: 10,000.00 USD
Credit:  10,000.00 XUSD
Fee:     10.00 USD
```

Show fees as a separate line item.

## 16. Formatting hygiene

| Rule                                         |         Correct |         Incorrect |
| -------------------------------------------- | --------------: | ----------------: |
| Currency code after number                   |     `1,232 USD` |       `USD 1,232` |
| No currency symbol                           |     `1,232 USD` |          `$1,232` |
| Exact fiat has 2 decimals                    |     `10.00 USD` |          `10 USD` |
| Simplified below 1,000 drops `.00`           |       `500 USD` |      `500.00 USD` |
| Simplified abbreviation drops trailing zeros |      `100K USD` |     `100.00K USD` |
| Abbreviation keeps useful decimals           |    `12.54K USD` |         `12K USD` |
| No space before K/M/B                        |      `1.2M USD` |       `1.2 M USD` |
| Negative sign                                | `-1,247.50 USD` |  `(1,247.50 USD)` |
| Error state                                  |             `—` | `N/A`, `0.00 USD` |

## 17. Engineering test cases

Implement these rules in one shared formatting helper, for example `formatAmount(value, code, context)`, and let the tables in sections 3, 4, 5, 7, 8, 9 and 14 be its tests. Contexts: `simplified` (truncates, user balances), `aggregate` (rounds, stats), `exact` (2 decimals, truncates), `fee` (rounds up) and `full` (every digit). A missing value returns `—`. Keep raw values in data and call the helper at render time.

|          Input | Context                 |            Expected |
| -------------: | ----------------------- | ------------------: |
|            `0` | Simplified balance      |             `0 USD` |
|            `0` | Exact balance           |          `0.00 USD` |
|       `0.0042` | Overview                |        `< 0.01 USD` |
|       `0.0042` | Fee                     |        `0.0042 USD` |
|       `500.00` | Simplified balance      |           `500 USD` |
|       `500.10` | Simplified balance      |        `500.10 USD` |
|     `1,232.42` | Simplified balance      |         `1,232 USD` |
|     `1,232.42` | Exact balance           |      `1,232.42 USD` |
|    `10,000.00` | Simplified user balance |           `10K USD` |
|    `10,500.00` | Simplified user balance |         `10.5K USD` |
|    `10,547.32` | Simplified user balance |        `10.54K USD` |
|   `100,000.00` | Simplified user balance |          `100K USD` |
|   `100,500.00` | Simplified user balance |        `100.5K USD` |
|    `12,547.32` | Simplified user balance |        `12.54K USD` |
|    `12,547.32` | Aggregate stat          |        `12.55K USD` |
|   `999,999.99` | Simplified user balance |       `999.99K USD` |
|    `1,000,000` | Simplified user balance |            `1M USD` |
|    `1,200,000` | Simplified user balance |          `1.2M USD` |
| `1,247,893.42` | Simplified user balance |         `1.24M USD` |
| `1,247,893.42` | Exact balance           |  `1,247,893.42 USD` |
|   `-12,547.32` | Simplified balance      |       `-12.54K USD` |
|  `-100,000.00` | Simplified balance      |         `-100K USD` |
|   `0.00001234` | Token balance           |    `0.00001234 ETH` |
| `1,247.503829` | Stablecoin receipt      | `1,247.503829 XUSD` |
