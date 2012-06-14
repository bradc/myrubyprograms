# Ruby Batch 33
# # BradC
# # File: wk1ex.rb
# #====================
describe 'Week 2 - Exercises' do

  describe 'Ex01 - String processing' do
    before :each do
      @io_buffer=''
      @out = StringIO.new @io_buffer
    end
    after :each do
      @io_buffer=''
    end
    it 'should split strings and keep a count' do
      Data = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
      Data.each_with_index {|line,line_number| @out.puts "Line #{line_number}: #{line}" }
      @io_buffer.should=="Line 0: Welcome to the forum.\nLine 1: Here you can learn Ruby.\nLine 2: Along with other members.\n"
    end 
  end

  # Ex02 - Understand difference between two outputs.
  # - Decided would be easier to simply write it out.
  # In example 1 the return value from mtdarry is is discarded. (i.e. not used)
  # - The return value from mtdarry is the value returned from #times.
  #   - In this case, 10: 10.times
  # In example 2 the return value from mtdarry was displayed using puts.
  require 'leap_year'
  describe 'Ex03 - Leap Year' do
    it 'should correctly identify a leap year' do
      leap_year?(2004).should==true
    end
    it 'should correctly identify a non-leap year' do
      leap_year?(1999).should==false
    end
    it 'should correctly identify a leap century' do
      leap_year?(2000).should==true
    end
    it 'should correctly identify a non-leap century' do
      leap_year?(1900).should==false
    end
  end
end

