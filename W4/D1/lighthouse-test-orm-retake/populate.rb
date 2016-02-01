require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

require './models/suite'
require './models/booking'

require './factories/suites'
require './factories/bookings'

# Connect to the DB
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/questions.sqlite3"
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end


s1 = FactoryGirl.create :suite, number: '200'
s2 = FactoryGirl.create :suite, number: '205'
s3 = FactoryGirl.create :suite, number: '310'
s4 = FactoryGirl.create :suite, number: '363'

FactoryGirl.create :booking,          suite: s1, full_name: 'Pepe Roni', nightly_discount: 10
FactoryGirl.create :current_booking,  suite: s1, full_name: 'Sue Flay', guests: 1
FactoryGirl.create :previous_booking, suite: s1, full_name: 'Terry Bull'
FactoryGirl.create :booking,          suite: s1, full_name: 'Woody Forrest', guests: 2, checkin: '2014-01-14', checkout: '2014-01-20'
FactoryGirl.create :booking,          suite: s1, full_name: 'Tim Burr', guests: 2, checkin: '2014-05-16', checkout: '2014-05-22'

FactoryGirl.create :multiday_booking, suite: s2, full_name: 'Owen Cash', guests: 3, nightly_discount: 30

FactoryGirl.create :multiday_booking, suite: s3, full_name: 'Tish Hughes', nightly_discount: 20
FactoryGirl.create :booking,          suite: s3, full_name: 'Tom A. Toe', guests: 4
FactoryGirl.create :booking,          suite: s3, full_name: 'Wanda Rinn', guests: 2, checkin: '2014-03-04', checkout: '2014-03-09'
