# Portfolio 3: Transactions and Concurrency

## 1. Overview
This exercise demonstrates PostgreSQL transaction management, rollback operations, row-level locking, and transaction isolation using the NexarBank database.

## 2. Environment
- Database: PostgreSQL 18
- Database name: nexarbank
- Management tool: pgAdmin 4

## 3. Practical Exercises

### Exercise 1: Transaction Rollback and Savepoints
A transaction was started, and temporary account balance updates were performed. A SAVEPOINT was created, followed by a partial rollback and a full rollback.

**Result:** The original account balance remained ₦180,000.

### Exercise 2: Row-Level Locking
Two pgAdmin Query Tool sessions were used to demonstrate concurrent access to the same account record.

Session A acquired a row-level lock using `SELECT FOR UPDATE`. Session B attempted to update the same record and waited until Session A committed.

**Result:** The lock was released, Session B completed its update, and the test update was rolled back.

### Exercise 3: Transaction Isolation

**READ COMMITTED:** A transaction read an account balance, while another session committed an update. A subsequent query in the first session returned the newly committed balance.

**REPEATABLE READ:** A transaction retained its original snapshot after another session committed an update. The repeated query continued to return the earlier balance.

**Result:** The experiments demonstrated the difference between PostgreSQL's READ COMMITTED and REPEATABLE READ isolation levels.

## 4. Evidence
Screenshots of the SQL execution, transaction results, row-level locking behaviour, and isolation tests are stored in the `evidence` directory.

## 5. Conclusion
The exercises demonstrated how PostgreSQL handles transaction boundaries, rollback, concurrent updates, row-level locks, and transaction isolation. These mechanisms help maintain data consistency when multiple users access banking records simultaneously.