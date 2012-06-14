class Numeric
  def divide_with_remainder divisor
    # Use Float to ensure divisor is a floating point number; will error if it is not. 
    quotient_with_remainder=self/Float(divisor) # Will let the ruby runtime handle any division by 0
    # Separate quotient from remainder and return them as elements of an array.
    [quotient=quotient_with_remainder.truncate,  
     quotient_with_remainder-quotient]  
  end
end

SECONDS_IN_YEAR = 60.0 * 60 * 24 * 365  # NOTE: no allowance for leap year.

def as_age age_in_seconds
  year,month=age_in_seconds.divide_with_remainder SECONDS_IN_YEAR
  [year,(month*12).truncate] # Could probably use round here, but I didn't. :)
end

Display="I'm %d years and %d months old."
[979000000,
 2158493738,
 2461144023,
 1270166272,
 1025600095].each {|age_in_seconds| puts  Display % as_age(age_in_seconds)}
