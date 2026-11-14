
# Portfolio 2: Query Processing and Optimisation

## 1. Case Study

NexarBank is a simulated Nigerian commercial bank.
This exercise evaluates SQL query processing and optimisation
using its PostgreSQL banking database.

## 2. Database Environment

- Database: PostgreSQL 18
- Administration Tool: pgAdmin 4
- Dataset: 10,003 bank accounts
- Related tables: customers and accounts

## 3. Query Development

A SQL query was developed to retrieve active customer accounts,
including customer details, account numbers, balances and
account types.

The query uses:
- INNER JOIN
- WHERE filtering
- ORDER BY sorting

## 4. Indexing Strategy

The following index was created:

`idx_accounts_status_balance`

```sql
CREATE INDEX idx_accounts_status_balance
ON accounts (account_status, balance DESC);
```

The index supports account-status filtering and balance ordering.

## 5. Execution Plan Analysis

PostgreSQL execution plans were examined using:

`EXPLAIN (ANALYZE, BUFFERS)`

Two execution approaches were compared using the same dataset.

| Metric | Indexed | Non-indexed |
|---|---:|---:|
| Execution time | 0.528 ms | 0.885 ms |
| Accounts scan | Bitmap Heap Scan | Sequential Scan |
| Join method | Nested Loop | Hash Join |

The indexed execution was approximately 40.3% faster
in this particular test.

## 6. Performance Interpretation

The indexed execution plan used the newly created
`idx_accounts_status_balance` index through a Bitmap Index Scan.

The non-indexed comparison used a Sequential Scan
and Hash Join.

The observed result demonstrates how indexing can
improve query performance for larger datasets.

Execution times are specific to this test environment
and may vary across repeated runs and workloads.

## 7. Evidence

The evidence folder contains:

- Baseline execution plan
- Indexed execution plan
- Large-dataset execution plan
- Non-indexed execution plan

## 8. Conclusion

This exercise demonstrates SQL query development,
index creation and execution-plan analysis using PostgreSQL.

It also highlights the importance of evaluating database
performance using actual execution plans and measurements.
