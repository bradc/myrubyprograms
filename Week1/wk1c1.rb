SECONDS_IN_YEAR = 60.0 * 60 * 24 * 365  # NOTE: no allowance for leap year.
def as_age age_in_seconds
  age_in_seconds.div SECONDS_IN_YEAR
end
[979000000].each {|_| p [:age, as_age(_)]}
