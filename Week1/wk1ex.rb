# Ruby Batch 33
# BradC
# File: wk1ex.rb
#====================

require 'rspec'
require './temp_convert'

describe 'Week 1 Exercises' do
  #1) Goal: Understanding operator precedence and association.
  describe 'Ex01 - Operator Precedence' do
    before (:all) do 
      @y = false
      @z = true
    end
    it 'x should be false and expression should evaluate to be true' do
    retval=(x = @y or @z)
      x.should be false
      retval.should be true

      # Use of the parenthesis here does not change the result from above,
      # it simply highlights the value of knowing precendence.
      retval=( (x=@y) or @z)
      x.should be false
      retval.should be true
    end
    it 'x should evaluate to true' do
      x = (@y or @z)
      x.should be true
    end 
  end

  #2) Experiment with sprintf (i.e. %): read docs & determine value of
  #puts "%05d" % 123
  describe 'Ex02 - Sprintf' do
    it 'format should be 00123' do
      ("%05d" % 123).should == '00123'
    end
  end

  #3) Display age in years given age in seconds.
  describe 'Ex03 - Age calcuations and display' do
    it 'age of 979_000_000 seconds should be 31.04 years' do
      # TODO: Make calculation parameteric to allow for leap years
      SecondsInYear=60*60*24*365.0
      # TODO: 
      age='%4.2f' % (979_000_000 / SecondsInYear)
      age.should=='31.04'
      Float(age).should==31.04
    end
  end
  #4) Determine the number of minutes per year
  describe 'Ex04 - Calculate number of minutes per year' do
    it 'minutes in a year should be 525600' do
      # TODO: Make calculation parameteric to allow for leap years
      minutes_in_year = 60*24*365
      minutes_in_year.should==525600
    end
  end
  #5) Explain why variable value is printed and not the method result.
  # - When ruby encounters a bare word it checks it's symbol table. First 
  #   for an entry in the variable table, if unresolved then moves to methods.
  # - Interestingly, if the parenthesis are added, i.e. my_string() Ruby
  #   skips the check for variables and goes straight to the method table.
  describe 'Ex05 - Observe scoping' do
    it 'my_string should display value of variable' do
      require 'stringio'
      buffer = ''
      io = StringIO.new buffer
      my_string = 'Hello Ruby World'
      def my_string
        'Hello World'
      end
      io.puts my_string
      buffer.chomp.should=='Hello Ruby World'
    end
  end

  #6) Write a temperature conversion routine that converts from Fahrenheit to Celsius.
  #NOTE: I didn't bother writing the version using round. Nothing against round, just 
  #didn't want to. :)
  describe 'Ex06 - Convert Fahrenheit to Celsius' do 
    it 'should convert given fahrenheit value to celsius' do
      # Values taken from http://fahrenheittocelsius.com/
      # Must be a better way, this is pretty tedius
      # Also, the all the values apparently calculate out to be ##.#0!
      # Pretty convenient. :S
      #
      # Generate test data
      FahrenheitValues=14.00.step(105.0,1.8).to_a
      CelsiusValues=-10.00.step(41,1.0).to_a
      # Create a table of conversions as cross check with calculate_celsius results.    
      F2C_ConversionTable=Hash[FahrenheitValues.zip(CelsiusValues)]
      # Note: exercise used a higher precision floating point number, e.g. 1.2022327
      # The results in this table are generally single precision 3.2 (where the 0 
      # can be assumed, i.e. 3.20. This is a product of the source data and not 
      # reflective of the calculations.
      FahrenheitValues.each do |f|
        Float('%.2f' % convert(f)).should==Float('%.2f' % F2C_ConversionTable[f])
      end
    end
  end
end
