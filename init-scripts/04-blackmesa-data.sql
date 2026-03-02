-- ============================================================
--  BLACK MESA FINANCIAL SERVICES — Seed Data
-- ============================================================
SET search_path TO blackmesa;

-- ------------------------------------------------------------
-- BRANCHES
-- ------------------------------------------------------------
INSERT INTO blackmesa.branches (branch_name, location, established, is_underground) VALUES
    ('Lambda Complex Branch',           'Sector F, Level -7',       '1985-03-10', TRUE),
    ('Surface Administration Branch',   'Mesa Hub, Ground Floor',   '1985-03-10', FALSE),
    ('Anomalous Materials Branch',      'Sector C, Level -3',       '1990-06-15', TRUE),
    ('Hydroelectric Facility Branch',   'Sector D, Reservoir Level','1992-09-01', FALSE),
    ('Xen Relay Station Branch',        'Classified, Level -12',    '2000-11-22', TRUE);

-- ------------------------------------------------------------
-- DEPARTMENTS
-- ------------------------------------------------------------
INSERT INTO blackmesa.departments (dept_name, branch_id, annual_budget, headcount_cap) VALUES
    ('Retail Banking & Teller Services',        2,   950000.00,  40),
    ('Research Grant Accounts',                 1,  7500000.00,  15),
    ('Loan Underwriting',                       2,  1200000.00,  22),
    ('Classified Asset Management',             5, 15000000.00,   8),
    ('Fraud Detection & Containment',           3,  2200000.00,  18),
    ('IT & Core Banking Systems',               2,   880000.00,  30),
    ('Employee Payroll & Benefits',             2,   600000.00,  12),
    ('Facilities Expansion Finance',            4,  3400000.00,  10);

-- ------------------------------------------------------------
-- EMPLOYEES
-- ------------------------------------------------------------
INSERT INTO blackmesa.employees (first_name, last_name, title, dept_id, hire_date, annual_salary, clearance_level, is_active) VALUES
    ('Gordon',    'Freeman',    'Senior Research Grant Analyst',     2,  '1997-05-16',  72000.00, 5, TRUE),
    ('Barney',    'Calhoun',    'Head of Security & Teller Ops',     1,  '1994-08-01',  58000.00, 3, TRUE),
    ('Eli',       'Vance',      'Director of Research Finance',      2,  '1985-03-10', 135000.00, 7, TRUE),
    ('Alyx',      'Vance',      'Systems Analyst, Core Banking',     6,  '2010-04-22',  89000.00, 4, TRUE),
    ('Isaac',     'Kleiner',    'VP of Research Grant Accounts',     2,  '1985-03-10', 148000.00, 7, TRUE),
    ('Judith',    'Mossman',    'Loan Underwriting Specialist',      3,  '1999-02-14',  95000.00, 5, TRUE),
    ('Wallace',   'Breen',      'Chief Executive Officer',           4,  '1985-03-10', 420000.00, 7, TRUE),
    ('Douglas',   'Rattmann',   'Fraud Detection Analyst',           5,  '2002-07-30',  67000.00, 3, TRUE),
    ('Walter',    'Bennet',     'Teller I',                          1,  '2018-01-08',  38000.00, 1, TRUE),
    ('Gina',      'Cross',      'Teller II',                         1,  '2016-03-21',  42000.00, 2, TRUE),
    ('Colette',   'Green',      'Loan Officer',                      3,  '2013-11-05',  71000.00, 3, TRUE),
    ('Adrian',    'Shephard',   'Facilities Expansion Analyst',      8,  '2005-09-12',  63000.00, 4, TRUE),
    ('Harold',    'Imes',       'Payroll Coordinator',               7,  '2008-06-18',  52000.00, 2, TRUE),
    ('Richard',   'Keller',     'IT Systems Administrator',          6,  '2011-10-03',  81000.00, 3, TRUE),
    ('Magnusson', 'Dr',         'Head of Classified Asset Mgmt',     4,  '1991-04-17', 162000.00, 7, FALSE);

-- ------------------------------------------------------------
-- ACCOUNTS
-- ------------------------------------------------------------
INSERT INTO blackmesa.accounts (account_number, account_type, owner_name, branch_id, opened_date, balance, interest_rate, is_frozen) VALUES
    ('BM000100001A', 'Checking',        'Gordon Freeman',               2, '1997-05-20',    4823.17, NULL,   FALSE),
    ('BM000100002A', 'Savings',         'Gordon Freeman',               2, '1997-05-20',   22150.00, 0.0300, FALSE),
    ('BM000100003A', 'Checking',        'Barney Calhoun',               2, '1994-09-01',    1200.55, NULL,   FALSE),
    ('BM000100004A', 'Savings',         'Barney Calhoun',               2, '1994-09-01',    8750.00, 0.0300, FALSE),
    ('BM000200001A', 'Research Grant',  'Kleiner Labs LLC',             1, '1990-01-15', 2500000.00, 0.0125, FALSE),
    ('BM000200002A', 'Research Grant',  'Anomalous Materials Div.',     3, '1990-06-20', 4100000.00, 0.0125, FALSE),
    ('BM000300001A', 'Classified',      'Administrator Breen',          5, '1985-03-10', 9875432.10, 0.0500, FALSE),
    ('BM000100005A', 'Checking',        'Judith Mossman',               2, '1999-03-01',    3310.88, NULL,   FALSE),
    ('BM000100006A', 'Savings',         'Alyx Vance',                   2, '2010-05-01',   15200.00, 0.0300, FALSE),
    ('BM000100007A', 'Checking',        'Alyx Vance',                   2, '2010-05-01',    2900.00, NULL,   FALSE),
    ('BM000100008A', 'Checking',        'Adrian Shephard',              4, '2005-10-01',     540.22, NULL,   TRUE),
    ('BM000200003A', 'Research Grant',  'Xen Relay Research Team',      5, '2001-02-28', 1750000.00, 0.0125, FALSE),
    ('BM000100009A', 'Savings',         'Eli Vance',                    1, '1985-04-01',   98320.50, 0.0350, FALSE),
    ('BM000100010A', 'Checking',        'Harold Imes',                  2, '2008-07-01',    2105.66, NULL,   FALSE),
    ('BM000300002A', 'Classified',      'Black Mesa Contingency Fund',  5, '1985-03-10',50000000.00, 0.0450, FALSE);

-- ------------------------------------------------------------
-- LOANS
-- ------------------------------------------------------------
INSERT INTO blackmesa.loans (account_id, loan_type, principal, interest_rate, term_months, issued_date, status) VALUES
    (1,  'Personal',             15000.00, 0.0699, 60,  '2020-03-01', 'Active'),
    (5,  'Research Equipment', 850000.00,  0.0425, 120, '2018-07-15', 'Active'),
    (6,  'Research Equipment', 620000.00,  0.0425, 84,  '2021-01-10', 'Active'),
    (8,  'Personal',             22000.00, 0.0799, 48,  '2022-06-01', 'Active'),
    (11, 'Facility Expansion', 200000.00,  0.0550, 180, '2019-09-20', 'Active'),
    (3,  'Personal',              5000.00, 0.0699, 24,  '2021-11-01', 'Paid Off'),
    (12, 'Research Equipment', 400000.00,  0.0400, 60,  '2020-05-05', 'Active'),
    (7,  'Emergency Containment',750000.00,0.0300, 36,  '2003-06-01', 'Paid Off'),
    (1,  'Personal',              8500.00, 0.0799, 36,  '2023-01-15', 'Active'),
    (8,  'Personal',             12000.00, 0.0999, 24,  '2023-08-01', 'Defaulted');

-- ------------------------------------------------------------
-- TRANSACTIONS  (a healthy mix of types and amounts)
-- ------------------------------------------------------------
INSERT INTO blackmesa.transactions (account_id, transaction_date, transaction_type, amount, description, processed_by) VALUES
-- Gordon Freeman checking (acct 1)
    (1,  '2024-01-05 09:14:00', 'Deposit',      2500.00,  'Payroll deposit – Jan 1',          2),
    (1,  '2024-01-12 11:30:00', 'Withdrawal',    200.00,  'ATM withdrawal – Sector C kiosk',  NULL),
    (1,  '2024-01-20 14:05:00', 'Fee',            35.00,  'Overdraft protection fee',          9),
    (1,  '2024-02-05 09:10:00', 'Deposit',      2500.00,  'Payroll deposit – Feb 1',           2),
    (1,  '2024-02-14 16:22:00', 'Loan Payment',  312.50,  'Personal loan payment',             9),
    (1,  '2024-03-05 09:10:00', 'Deposit',      2500.00,  'Payroll deposit – Mar 1',           2),
    (1,  '2024-03-18 10:45:00', 'Transfer',      500.00,  'Transfer to savings BM000100002A',  9),
-- Gordon Freeman savings (acct 2)
    (2,  '2024-01-18 10:00:00', 'Interest',       54.72,  'Monthly interest credit',          NULL),
    (2,  '2024-02-18 10:00:00', 'Interest',       55.10,  'Monthly interest credit',          NULL),
    (2,  '2024-03-18 10:00:00', 'Transfer',      500.00,  'Transfer from checking BM000100001A', 9),
    (2,  '2024-03-18 10:01:00', 'Interest',       55.48,  'Monthly interest credit',          NULL),
-- Barney Calhoun checking (acct 3)
    (3,  '2024-01-05 09:14:00', 'Deposit',      1600.00,  'Payroll deposit – Jan 1',           2),
    (3,  '2024-01-22 13:00:00', 'Withdrawal',    350.00,  'Withdrawal – Mesa commissary',     10),
    (3,  '2024-02-05 09:14:00', 'Deposit',      1600.00,  'Payroll deposit – Feb 1',           2),
    (3,  '2024-03-05 09:14:00', 'Deposit',      1600.00,  'Payroll deposit – Mar 1',           2),
-- Kleiner Labs research grant (acct 5)
    (5,  '2024-01-10 08:00:00', 'Deposit',    250000.00,  'DOE Research Grant Q1 disbursement',5),
    (5,  '2024-01-15 08:30:00', 'Withdrawal', 120000.00,  'Anti-mass spectrometer parts',      5),
    (5,  '2024-02-01 09:00:00', 'Loan Payment', 8850.62,  'Equipment loan payment',           11),
    (5,  '2024-03-01 09:00:00', 'Loan Payment', 8850.62,  'Equipment loan payment',           11),
    (5,  '2024-03-20 14:00:00', 'Withdrawal',  75000.00,  'Teleportation array components',    5),
-- Anomalous Materials research grant (acct 6)
    (6,  '2024-01-08 07:45:00', 'Deposit',    500000.00,  'Annual grant tranche 1',            5),
    (6,  '2024-01-25 10:10:00', 'Withdrawal', 230000.00,  'Sample containment equipment',      6),
    (6,  '2024-02-08 07:45:00', 'Deposit',    500000.00,  'Annual grant tranche 2',            5),
    (6,  '2024-02-20 11:30:00', 'Withdrawal', 180000.00,  'Lambda particle accelerator parts', 6),
    (6,  '2024-02-01 09:00:00', 'Loan Payment', 7932.10,  'Equipment loan payment',           11),
-- Admin Breen classified (acct 7)
    (7,  '2024-01-02 06:00:00', 'Deposit',    500000.00,  'Classified inbound wire – Source A',NULL),
    (7,  '2024-02-02 06:00:00', 'Deposit',    500000.00,  'Classified inbound wire – Source A',NULL),
    (7,  '2024-03-02 06:00:00', 'Deposit',    500000.00,  'Classified inbound wire – Source A',NULL),
    (7,  '2024-03-15 22:00:00', 'Transfer',   200000.00,  'Wire to Combine Holdings Ltd.',     NULL),
    (7,  '2024-01-31 23:59:00', 'Interest',  39497.24,    'Monthly interest credit',          NULL),
-- Judith Mossman checking (acct 8)
    (8,  '2024-01-05 09:14:00', 'Deposit',      2600.00,  'Payroll deposit – Jan 1',           2),
    (8,  '2024-01-29 15:00:00', 'Withdrawal',   400.00,   'ATM withdrawal',                   NULL),
    (8,  '2024-02-05 09:14:00', 'Deposit',      2600.00,  'Payroll deposit – Feb 1',           2),
    (8,  '2024-02-14 16:00:00', 'Loan Payment',  512.00,  'Personal loan payment',             9),
    (8,  '2024-03-05 09:14:00', 'Deposit',      2600.00,  'Payroll deposit – Mar 1',           2),
-- Alyx Vance savings (acct 9)
    (9,  '2024-01-18 10:00:00', 'Interest',      38.00,   'Monthly interest credit',          NULL),
    (9,  '2024-02-01 12:00:00', 'Deposit',     1000.00,   'Manual savings contribution',      10),
    (9,  '2024-02-18 10:00:00', 'Interest',      40.50,   'Monthly interest credit',          NULL),
    (9,  '2024-03-18 10:00:00', 'Interest',      41.00,   'Monthly interest credit',          NULL),
-- Xen Relay research grant (acct 12)
    (12, '2024-01-12 08:00:00', 'Deposit',    175000.00,  'Classified research allocation',    5),
    (12, '2024-02-01 09:00:00', 'Loan Payment', 7388.22,  'Equipment loan payment',           11),
    (12, '2024-02-15 09:30:00', 'Withdrawal',  90000.00,  'Xen relay dish hardware',           5),
    (12, '2024-03-01 09:00:00', 'Loan Payment', 7388.22,  'Equipment loan payment',           11),
-- Eli Vance savings (acct 13)
    (13, '2024-01-18 10:00:00', 'Interest',     286.44,   'Monthly interest credit',          NULL),
    (13, '2024-02-18 10:00:00', 'Interest',     287.11,   'Monthly interest credit',          NULL),
    (13, '2024-03-18 10:00:00', 'Interest',     287.78,   'Monthly interest credit',          NULL),
-- Harold Imes checking (acct 14)
    (14, '2024-01-05 09:14:00', 'Deposit',      1450.00,  'Payroll deposit – Jan 1',           2),
    (14, '2024-01-20 11:00:00', 'Withdrawal',    100.00,  'ATM withdrawal',                   NULL),
    (14, '2024-02-05 09:14:00', 'Deposit',      1450.00,  'Payroll deposit – Feb 1',           2),
    (14, '2024-03-05 09:14:00', 'Deposit',      1450.00,  'Payroll deposit – Mar 1',           2),
-- Black Mesa Contingency Fund (acct 15)
    (15, '2024-01-01 00:01:00', 'Interest',   187500.00,  'Monthly interest credit',          NULL),
    (15, '2024-02-01 00:01:00', 'Interest',   187500.00,  'Monthly interest credit',          NULL),
    (15, '2024-03-01 00:01:00', 'Interest',   187500.00,  'Monthly interest credit',          NULL);
