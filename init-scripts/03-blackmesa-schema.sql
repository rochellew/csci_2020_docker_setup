CREATE SCHEMA IF NOT EXISTS blackmesa;

-- Drop tables in reverse dependency order for clean re-runs
DROP TABLE IF EXISTS blackmesa.transactions    CASCADE;
DROP TABLE IF EXISTS blackmesa.loans           CASCADE;
DROP TABLE IF EXISTS blackmesa.accounts        CASCADE;
DROP TABLE IF EXISTS blackmesa.employees       CASCADE;
DROP TABLE IF EXISTS blackmesa.departments     CASCADE;
DROP TABLE IF EXISTS blackmesa.branches        CASCADE;

CREATE TABLE blackmesa.branches (
    branch_id       SERIAL PRIMARY KEY,
    branch_name     VARCHAR(100) NOT NULL,
    location        VARCHAR(100) NOT NULL,   -- e.g. "Sector C, Level -3"
    established     DATE         NOT NULL,
    is_underground  BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE blackmesa.departments (
    dept_id         SERIAL PRIMARY KEY,
    dept_name       VARCHAR(100) NOT NULL,
    branch_id       INTEGER REFERENCES blackmesa.branches(branch_id),
    annual_budget   NUMERIC(15,2) NOT NULL,
    headcount_cap   INTEGER NOT NULL
);

CREATE TABLE blackmesa.employees (
    employee_id     SERIAL PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    title           VARCHAR(100),
    dept_id         INTEGER REFERENCES blackmesa.departments(dept_id),
    hire_date       DATE         NOT NULL,
    annual_salary   NUMERIC(12,2) NOT NULL,
    clearance_level INTEGER      NOT NULL CHECK (clearance_level BETWEEN 1 AND 7),
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE
);

CREATE TABLE blackmesa.accounts (
    account_id      SERIAL PRIMARY KEY,
    account_number  CHAR(12)     NOT NULL UNIQUE,
    account_type    VARCHAR(20)  NOT NULL CHECK (
                        account_type IN ('Checking', 'Savings', 'Research Grant', 'Classified')
                    ),
    owner_name      VARCHAR(100) NOT NULL,
    branch_id       INTEGER REFERENCES blackmesa.branches(branch_id),
    opened_date     DATE         NOT NULL,
    balance         NUMERIC(15,2) NOT NULL DEFAULT 0.00,
    interest_rate   NUMERIC(5,4),           -- NULL for checking accounts
    is_frozen       BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE blackmesa.loans (
    loan_id         SERIAL PRIMARY KEY,
    account_id      INTEGER REFERENCES blackmesa.accounts(account_id),
    loan_type       VARCHAR(50)  NOT NULL CHECK (
                        loan_type IN ('Personal', 'Research Equipment', 'Facility Expansion', 'Emergency Containment')
                    ),
    principal       NUMERIC(15,2) NOT NULL,
    interest_rate   NUMERIC(5,4) NOT NULL,
    term_months     INTEGER      NOT NULL,
    issued_date     DATE         NOT NULL,
    status          VARCHAR(20)  NOT NULL CHECK (
                        status IN ('Active', 'Paid Off', 'Defaulted', 'Under Review')
                    )
);

CREATE TABLE blackmesa.transactions (
    transaction_id  SERIAL PRIMARY KEY,
    account_id      INTEGER REFERENCES blackmesa.accounts(account_id),
    transaction_date TIMESTAMP   NOT NULL DEFAULT NOW(),
    transaction_type VARCHAR(20) NOT NULL CHECK (
                        transaction_type IN ('Deposit', 'Withdrawal', 'Transfer', 'Interest', 'Fee', 'Loan Payment')
                    ),
    amount          NUMERIC(15,2) NOT NULL,
    description     VARCHAR(255),
    processed_by    INTEGER REFERENCES blackmesa.employees(employee_id)
);
