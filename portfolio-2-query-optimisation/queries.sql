
-- NexarBank
-- Portfolio 2: Query Processing and Optimisation

-- QUERY 1: Retrieve active customer accounts

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance,
    a.account_type
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.account_status = 'active'
ORDER BY a.balance DESC;


-- QUERY 2: Create optimisation index

CREATE INDEX idx_accounts_status_balance
ON accounts (account_status, balance DESC);


-- QUERY 3: Analyse indexed execution plan

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance,
    a.account_type
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.account_status = 'active'
ORDER BY a.balance DESC;


-- QUERY 4: Non-indexed execution plan comparison
-- Temporarily disable index and bitmap scans.

BEGIN;

SET LOCAL enable_indexscan = OFF;
SET LOCAL enable_bitmapscan = OFF;

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance,
    a.account_type
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.account_status = 'active'
ORDER BY a.balance DESC;

ROLLBACK;


-- PERFORMANCE OBSERVATIONS
-- Indexed execution time: 0.528 ms
-- Non-indexed execution time: 0.885 ms
-- Observed improvement: approximately 40.3%
-- Indexed plan: Bitmap Heap Scan and Nested Loop
-- Non-indexed plan: Sequential Scan and Hash Join
