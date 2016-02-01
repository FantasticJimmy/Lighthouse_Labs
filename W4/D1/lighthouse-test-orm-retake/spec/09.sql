-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 09      --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/09.sql
--
-- There are no automated tests for this question. You have to compare your result
-- to the expected output.

-- =============== --
-- IMPORTANT TIP
-- =============== --
-- 
-- The database schema is the same as before (see schema.rb). 
-- It has some seeded data in all the tables that you should quickly explore first
-- 
-- To get familiar with the data in a quick and easy way, you can connect to the database via the SQLite3 REPL:
-- From the test's root directory, type:
-- 
-- sqlite3 db/questions.sqlite3 

-- It is suggested that you run the three dot commands below after connecting, to make the output formatting more readable.
-- Use the .quit command to exit the REPL

-- ================= --
-- OUTPUT FORMATTING
-- ================= --
--
-- Leave the following lines in so that the output is formatted in a readable way.
.headers on
.mode column
.width 20
--
-- ======== --
-- QUESTION --
-- ======== --
--
-- Write a query that returns all the bookings (full_name, checkin, checkout) in the year 2015
-- 
-- Part B: Order the results by their checkin date with older checkin dates higher at the top
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- full_name             checkin     checkout  
-- --------------------  ----------  ----------
-- Terry Bull            2015-05-15  2015-05-17
-- Sue Flay              2015-06-13  2015-06-15
-- Pepe Roni             2015-06-15  2015-06-16
-- Owen Cash             2015-06-15  2015-06-17
-- Tish Hughes           2015-06-15  2015-06-17
-- Tom A. Toe            2015-06-15  2015-06-16        
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --

SELECT full_name, checkin, checkout FROM bookings WHERE julianday(checkin) > julianday('2014-12-31') AND julianday(checkout) > julianday('2014-12-31');
