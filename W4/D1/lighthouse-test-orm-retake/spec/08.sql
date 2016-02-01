-- ================ --
-- CUSTOM SQL QUERY --
-- QUESTION 08      --
-- ================ --
--
-- Execute this file directly against the SQLite3 database from the command line.
-- From the test's root directory, type:
--
-- sqlite3 db/questions.sqlite3 < spec/08.sql
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
-- Write a query that returns list of suite numbers along with the total number of guests that stayed in them
-- 
-- Part B: Suite 363 has no bookings. Display a sum of 0 total_guests instead of nothing (NULL) for it 
--
-- =============== --
-- EXPECTED OUTPUT --
-- =============== --
--
-- number                total_guests
-- --------------------  ------------
-- 200                   9           
-- 310                   8           
-- 205                   3           
-- 363                   0           
--
-- ====================== --
-- EDIT THE FOLLOWING SQL --
-- ====================== --

SELECT s.number, CASE when (sum(b.guests)) IS NULL THEN 0 ELSE (sum(b.guests)) END AS total_guests from suites AS s LEFT OUTER JOIN bookings as b ON b.suite_id = s.id GROUP BY s.number ORDER BY total_guests DESC;