-- PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY
-- Exercise 1: Demonstrating ROLLBACK and SAVEPOINT

-- Check the original balance
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- Start a transaction
BEGIN;

-- Temporarily increase the account balance
UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 1;

-- Create a savepoint
SAVEPOINT balance_checkpoint;

-- Make another temporary change
UPDATE accounts
SET balance = balance + 500
WHERE account_id = 1;

-- Undo the second change only
ROLLBACK TO SAVEPOINT balance_checkpoint;

-- Undo the entire transaction
ROLLBACK;

-- Verify that the original balance remains unchanged
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- Exercise 2: Row-Level Locking and Concurrency
-- Session A: Execute in Query Tool 1
BEGIN;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1
FOR UPDATE;

-- Session B: Execute in Query Tool 2
BEGIN;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 1;

-- Session A: Release the lock
COMMIT;

-- Session B: Undo the test update
ROLLBACK;

-- Verify the original balance
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- Exercise 3: Transaction Isolation Levels
--
-- TEST A: READ COMMITTED
-- SESSION A:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- SESSION B:
BEGIN;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 1;

COMMIT;

-- SESSION A: Run the SELECT again.
-- The new committed balance becomes visible.
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

COMMIT;


-- TEST B: REPEATABLE READ
-- SESSION A:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- SESSION B:
BEGIN;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 1;

COMMIT;

-- SESSION A: Run the SELECT again.
-- The original transaction snapshot remains visible.
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

COMMIT;

-- Verify the latest committed balance after both sessions finish.
SELECT account_id, balance
FROM accounts
WHERE account_id = 1;