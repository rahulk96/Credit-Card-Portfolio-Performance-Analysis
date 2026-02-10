CREATE DATABASE credit_card_db;
go

USE credit_card_db;
go

drop table credit_card_transactions

--Creating Table
CREATE TABLE credit_card_transactions (
    transaction_id      INT,
	city                VARCHAR(100),
    transaction_date    DATE,
    card_type           VARCHAR(50),
    exp_type            VARCHAR(50),
	gender              VARCHAR(10),
	amount				FLOAT
    --amount               DECIMAL(18, 2)
);

--Inserting Data into a staging table
SET DATEFORMAT dmy
BULK INSERT credit_card_transactions
FROM 'C:\Users\Rahul\Desktop\Credit Card\credit_card_transcations.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);



select * from credit_card_transactions;


select column_name, data_type from information_schema.columns
where table_name = 'credit_card_transactions';





--Data Validation Checks

-- Total records = 26052
SELECT COUNT(*) AS total_rows
FROM credit_card_transactions;


--Check NULLs in Each Column
SELECT
    COUNT(*) AS total_rows,

    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS transaction_id_nulls,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END)           AS city_nulls,
    SUM(CASE WHEN transaction_date IS NULL THEN 1 ELSE 0 END) AS transaction_date_nulls,
    SUM(CASE WHEN card_type IS NULL THEN 1 ELSE 0 END)      AS card_type_nulls,
    SUM(CASE WHEN exp_type IS NULL THEN 1 ELSE 0 END)       AS exp_type_nulls,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END)         AS gender_nulls,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END)         AS amount_nulls
FROM credit_card_transactions;



--Check BLANK / EMPTY Values (Strings)   	// transaction_date and amount are excluded here because: Dates can’t be blank strings // Amount is numeric
SELECT
    SUM(CASE WHEN LTRIM(RTRIM(transaction_id)) = '' THEN 1 ELSE 0 END) AS transaction_id_blanks,
    SUM(CASE WHEN LTRIM(RTRIM(city)) = '' THEN 1 ELSE 0 END)           AS city_blanks,
    SUM(CASE WHEN LTRIM(RTRIM(card_type)) = '' THEN 1 ELSE 0 END)      AS card_type_blanks,
    SUM(CASE WHEN LTRIM(RTRIM(exp_type)) = '' THEN 1 ELSE 0 END)       AS exp_type_blanks,
    SUM(CASE WHEN LTRIM(RTRIM(gender)) = '' THEN 1 ELSE 0 END)         AS gender_blanks
FROM credit_card_transactions;



--Duplicate transaction_id Check = No Duplicates
SELECT
    transaction_id,
    COUNT(*) AS duplicate_count
FROM credit_card_transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;


--Duplicate Row Check (All Columns)
SELECT
    transaction_id,
    city,
    transaction_date,
    card_type,
    exp_type,
    gender,
    amount,
    COUNT(*) AS duplicate_count
FROM credit_card_transactions
GROUP BY
    transaction_id,
    city,
    transaction_date,
    card_type,
    exp_type,
    gender,
    amount
HAVING COUNT(*) > 1;



