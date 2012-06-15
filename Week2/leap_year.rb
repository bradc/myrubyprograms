# RubyLearning.org
# Week 2: Exercise 3: Part 1
#
# Writing a leap_year? method to determine if a year is a leap year.
#
# Rules:
# Leap years
#   - Evenly divisible by 4
#   - Exception is full century, e.g. 1900, 2000, etc.
#     - For a full century to be a leap century it must be evenly divisble by 400
#   - Every year that does not match the above rules are 'common' years. 
# Notes:
# - Initial specs, not clear on handling errors.
def leap_year? year
  ((year%4).zero? && (year%100)!=0 || (year%400).zero?)
end

if $0 == __FILE__
  (1890..2020).each{ |year| puts "Year #{year} is #{leap_year?(year) ? 'a leap' : 'not a leap'} year"}
end
