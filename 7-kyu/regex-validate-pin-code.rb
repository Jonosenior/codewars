=begin

RegEx Validate Pin Code

ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.

If the function is passed a valid PIN string, return true, else return false.

eg:

validatePIN("1234") === true
validatePIN("12345") === false
validatePIN("a234") === false

=end

def validatePIN(pin)
  !!/^\d{4}$|^\d{6}$/.match(pin)
end

puts validatePIN("1234") #  => true
puts validatePIN("12345") #  => false
puts validatePIN("123456") #  => true
puts validatePIN("a234") # => false
