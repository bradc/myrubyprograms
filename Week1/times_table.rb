# Consider each product a field and to find a comfortable width for all products
# we need only consider the final product (i.e. multiple*multiple) 
# E.g.
#   Good spacing for 9 times table is:
#     9*9=81
#     81.to_s.length=2+padding (padding in this example will be 1)
#   So a good field width is 3.
def calculate_max_field_width multiple, padding=1
  ((multiple**2).to_s.length+padding) 
end

# Generates a row of the table at a time.
# Returns a string consisting of all the fields for row_number upto multiple columns.
def generate_row row_number, multiple
  max_field_width=calculate_max_field_width multiple
  # Assume a starting point of 1
  (1..multiple).inject(''){|line,column| 
    # The portion #{max_field_width}.#{max_field_width} is a way of creating a field that will not
    # expand to the size of the data being printed into it. Compare with %{max_wdith}s.
    # The field into which the string will be printed may grow freely, though it will not
    # get any smaller.
    line+"%#{max_field_width}.#{max_field_width}s" % (row_number*column)
  }
end

# Wrapping function for generate_row.
# Returns a string.
def generate_table integer 
  (1..integer).inject([]) {|box, row| 
    box << generate_row(row, integer)
  }.join("\n")
end

# Required method: multiplication_table
def multiplication_table integer, heading='', decorate = false
  # Since there was no stipulation as to how negative numbers were to be handled,
  # I choose to filter them out.
  unless integer < 0
    # Fudged the spacing for the formatted output by tacking on a space to heading and line.
    # Can everyone say, L..a..z..y! 
    title, line = decorate ? [' '+heading, %{\n #{'=' * calculate_max_field_width(integer)*integer}\n}] : ['','']
    '%s%s%s%s' % [title,line,generate_table(integer),line]
  else
    puts "Error:multiplication_table: can not generate table for numbers < 0 [Given: #{integer}]"
    nil
  end
end

if $0 == __FILE__
  puts multiplication_table 1, '1 times table', true 
  puts multiplication_table 0 
  puts multiplication_table 9, '9 Times table', true

  # Shows an error message and returns 'nil'
 puts multiplication_table -4, '-4 times table', true

 # Shows times table with and without decoration
 puts multiplication_table 10 
 puts multiplication_table 10, '10 times table', true
end
