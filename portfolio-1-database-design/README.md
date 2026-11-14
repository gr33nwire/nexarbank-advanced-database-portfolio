
# Portfolio 1: Database Design and Modelling

## 1. Case Study

NexarBank is a simulated Nigerian commercial bank. The database
supports customer registration, account management and banking
transactions.

The system is designed to maintain accurate customer records,
account balances and transaction histories.

## 2. Database Technology

- Database: PostgreSQL 18
- Administration Tool: pgAdmin 4
- Programming Language: SQL
- Diagramming Tool: diagrams.net

## 3. Database Tables

The database contains three relational tables.

### Customers
Stores customer information.

- Primary Key: customer_id
- Unique fields: email, phone

### Accounts
Stores customer bank account information.

- Primary Key: account_id
- Foreign Key: customer_id
- Unique field: account_number
- Constraint: balance cannot be negative

### Bank Transactions
Stores deposits, withdrawals and transfers.

- Primary Key: transaction_id
- Foreign Keys: source_account_id, destination_account_id
- Constraints: transaction amount must be positive.
- Transaction types: deposit, withdrawal and transfer.

## 4. Entity Relationships

- One customer can own multiple accounts.
- One account can originate multiple transactions.
- One account can receive multiple transactions.

The relationships are implemented using foreign keys.

See: evidence/NexaBank-ERD.png

## 5. Normalisation

### First Normal Form (1NF)
Each table contains atomic values, with no repeating groups.
Each record is uniquely identifiable through its primary key.

### Second Normal Form (2NF)
The tables use single-column primary keys. Non-key attributes
depend on their respective table's primary key.

### Third Normal Form (3NF)
Customer details are stored separately from account details.
Account information is linked to customers using customer_id.
Transaction records reference accounts instead of duplicating
account information.

This reduces unnecessary data duplication and update anomalies.

## 6. Integrity Constraints

The database implements:

- Primary key constraints.
- Foreign key constraints.
- Unique constraints.
- NOT NULL constraints.
- CHECK constraints.
- Default values.

These constraints help maintain data consistency and validity.

## 7. Implementation Evidence

Screenshots are provided in the evidence folder:

- Table structure
- Customer records
- Account records
- Transaction records
- Entity Relationship Diagram

## 8. Conclusion

The NexaBank relational database provides a structured foundation
for managing customer information, bank accounts and financial
transactions. PostgreSQL constraints and relationships help
maintain data integrity.
