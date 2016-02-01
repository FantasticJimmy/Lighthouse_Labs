Assessment Test 2 - ActiveRecord & SQL
==============

## Models

We're modelling a simple hotel guest management software. There are two models, `Booking` and `Suite` in the models folder. Use the `db/schema.rb` for reference about their columns.

## ActiveRecord Queries

**Important Note:**
Your queries (filtering a subset of data, sorting, etc) should leverage the database (by using ActiveRecord calls) instead of performing the filters using Ruby's methods (such as`sort`, `select` or `detect`).

## Questions

There are 12 questions, 2 of which are bonus, totalling 110%.
Run each test using the `bundle exec rspec` command (eg: `bundle exec rspec spec/01.rb`) and make it pass.

If you'd like to run a **specific** test (to drown out the noise), add the line number. Example:

    bundle exec rspec spec/01.rb:13

**Important Note**: Questions/tests that are imperative to make pass (are dependencies) for the rest of the questions are marked with a double star (**). In other words, you can safely skip questions that are not marked with any stars, in case you want to come back to them later.

**Important Note**: Some questions are SQL only. For these questions, please follow the instructions within the .sql (text) file. Your answer should be placed within these files.

## Mark Allocation

01. 5% **
02. 10%
03. 10%
04. 5%
05. 15%
06. 15%
07. 15% - SQL
08. 15% - SQL
09. 10% - SQL
10. 5% (BONUS)
11. 5% (BONUS) - SQL

## Rules (IMPORTANT)

* A mark of 80% or higher is considered a PASS.
* You are allowed to google around
* Please do not create a public repo nor share your work in any other way with anyone during the test
* This test is intended to take ~2hr to complete
* No collaboration with your peers is allowed during the test
* You will be deducted points for bad form (improper indentation, counter intuitive or confusing code, bad naming conventions, commented out code, etc)
