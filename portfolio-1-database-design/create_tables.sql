
-- ==========================================
-- NEXARBANK DATABASE
-- Portfolio 1: Database Design and Modelling
-- PostgreSQL 18
-- ==========================================

-- TABLE 1: CUSTOMERS

CREATE TABLE customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE 2: ACCOUNTS

CREATE TABLE accounts (
    account_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    account_number VARCHAR(10) UNIQUE NOT NULL,
    account_type VARCHAR(20) NOT NULL
        CHECK (account_type IN ('savings', 'current')),
    balance NUMERIC(15,2) NOT NULL DEFAULT 0
        CHECK (balance >= 0),
    currency CHAR(3) NOT NULL DEFAULT 'NGN',
    account_status VARCHAR(20) NOT NULL DEFAULT 'active'
        CHECK (account_status IN ('active', 'inactive', 'frozen')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- TABLE 3: BANK TRANSACTIONS

CREATE TABLE bank_transactions (
    transaction_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    source_account_id BIGINT REFERENCES accounts(account_id),
    destination_account_id BIGINT REFERENCES accounts(account_id),
    transaction_type VARCHAR(20) NOT NULL
        CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
    amount NUMERIC(15,2) NOT NULL CHECK (amount > 0),
    transaction_status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (transaction_status IN ('pending', 'successful', 'failed', 'reversed')),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT valid_transaction_accounts CHECK (
        (transaction_type = 'deposit'
            AND source_account_id IS NULL
            AND destination_account_id IS NOT NULL)
        OR
        (transaction_type = 'withdrawal'
            AND source_account_id IS NOT NULL
            AND destination_account_id IS NULL)
        OR
        (transaction_type = 'transfer'
            AND source_account_id IS NOT NULL
            AND destination_account_id IS NOT NULL
            AND source_account_id <> destination_account_id)
    )
);
