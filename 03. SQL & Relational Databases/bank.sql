-- In case there is already a bank_db database, drop it


-- Create a bank_db database


-- Connect to the bank_db databases


-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes


-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made


-- Insert 5 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.


-- You receive notice that the payment with id of 4 is $10 too low.
-- Alter that row so that it is corrected


-- Delete all payments with an amount under $2


-- Select all entries from the payments table


-- In a single query, output all payments ordered from the largest to the smallest


-- In a single query, output the names of all distinct recipients


-- In a single query, select all payments created in the past week


-- In a single query, select all payments with a blank description


-- In a single query, select all payments matching the name of one of the payers (choose any single one)