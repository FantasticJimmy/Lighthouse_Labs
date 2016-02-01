-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 07      --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/07.sql
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
-- Write a query that returns all the bookings (full_name, checkin, checkout) along with their total duration of stay
-- 
-- Part B: Order the results by their duration (highest first)
--
-- HINT: When researching / googling for SQL help, keep in mind that each RDBMS varies in terms of date functions, and that you are using SQLite in this test
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- full_name             checkin     checkout    duration  
-- --------------------  ----------  ----------  ----------
-- Woody Forrest         2014-01-14  2014-01-20  6         
-- Tim Burr              2014-05-16  2014-05-22  6         
-- Wanda Rinn            2014-03-04  2014-03-09  5         
-- Sue Flay              2015-06-13  2015-06-15  2         
-- Terry Bull            2015-05-15  2015-05-17  2         
-- Owen Cash             2015-06-15  2015-06-17  2         
-- Tish Hughes           2015-06-15  2015-06-17  2         
-- Pepe Roni             2015-06-15  2015-06-16  1         
-- Tom A. Toe            2015-06-15  2015-06-16  1         
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --

SELECT full_name, checkin, checkout, cast((julianday(checkout)-julianday(checkin)) AS INT) AS duration FROM bookings ORDER BY duration DESC;