Ruby Assessment Test (Retake): We N3eD MoRe F!SH. DEPL0Y THA DEEP-FISHR-9000!
====================

                                _/|     _/|-++'
                            +  +--|    |--|--|_ |-
                         { /|__|  |/\__|  |--- |||__/
                        +---------------___[}-_===_.'____                 /\
          _         ____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _
     __..._|___--==/___]_|__|_____________________________[___\==--____,------' .7
    |                                                 LIGHTHOUSE FISHING COMPANY/
     \_________________________________________________________________________|

## Introduction

The Lighthouse Fishing Company (LFC™), with its many smart TAs, has invented a new form of fishing: Underwater fishing!!! ZOMG!

Our new protoype deep sea vessel (The DEEP-FISHR-9000) needs to be deployed ASAP... 

"Why" you ask? Because the ocean is running out of fish and we need to take deep sea fishing to a whole new level baby!

Without the success of this prototype vessel, The LFC™ will *GO UNDER*! (pun very much intended)

This retake assessment test has 12 required questions and should be completed in 2 hours.

**Please read this document very carefully before starting.**

### Mark Allocation

01. 10%
02. 15%
03. 10%
04. 10%
05. 5%
06. 10%
07. 10%
08. 5%
09. 10%
10. 5%
11. 5%
12. 5%

## Tip

Read the `ocean.rb` code first and make sure you understand everything in there, especially the BOARD.

## Using RSpec

RSpec is a popular test framework for Ruby. A test framework allows us to write "test code" to test and ensure that our "actual code" functions as expected.

RSpec is a Ruby library. It's syntax/API allows us to write tests that are quite english-y to read. So even if you haven't seen or used RSpec before, the tests and expectations that it creates are fairly straight-forward to understand, because they read like english.

If you have questions about what the test is expecting, feel free to ask.

## Your Mission

Run each set of tests (specs) from the project's root directory via command line: `bundle exec rspec spec/01*.rb`.

The task will will output the results of the test and initially we will see a bunch of failing tests. 

Your goal is the make all the tests pass, before proceeding onto the next step.

**Steps:**

1. Read the CODE for the spec file that you ran.
2. Understand what tests it contains and what each test in that file is expecting.
3. Start implementing your code to satisfy each test.
4. Run the test suite using the same `bundle exec rspec` command, to ensure that you are seeing more and more passing tests.
5. Repeat steps 1 through 4 until all tests pass for that suite.

Once all the tests are passing for that suite, run the next suite.
Example: `bundle exec rspec spec/02*.rb`

When you are done implementing all the code, you can simply run `bundle exec rspec spec/*.rb` to run all the tests at once, and make sure everything is working as expected.

## Marking

Even if you make all the tests pass, you may lose marks for incorrectly implementing the solution. Example: incorrect use of OOP.

This test is created such that there are indeed correct right ways to implement your app, and incorrect ways.

You can also lose marks for bad form. Some Examples of bad form include:
* Improper or confusing naming of variables, methods, etc.
* Improper indentation
* Overly verbose code that could be implemented much more simply in Ruby
* Not writing code in the "Ruby Way". Example: using camel casing for variable or method names instead of underscores.

**Note:** Hard coding the behavior of a method to simply make the current tests pass but not actually fulfilling the goal/responsibility of the method will *not* count as a valid solution, warranting no part marks at all.

## Other Important Notes

* Do not modify the code in the `spec` folder.
* The tests will require you to create new classes as you progress. These will need to be created in the same folder as `submarine.rb`: the `lib` folder.
* You are allowed to google around.
* Please do not create a public repo nor share your work in any other way with anyone during the test.
* This test is intended to take 2 hours to complete.

