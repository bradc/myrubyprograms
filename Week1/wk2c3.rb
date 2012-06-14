require 'times_table'
Expected_1TimesTable='  1   2   3   4   5   6   7   8  9' 
describe 'Times Table' do
  it 'should generate 1 times table' do
    # Simplest test, a single row.
    table=multiplication_table 1, '1 Times Table', true
    table.should==Expected_1TimesTable
  end
  it 'should display a table header' do
  end
  it 'should not display a table header if decorate is false' do
  end
end
