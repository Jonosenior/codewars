=begin

Credit Card Mask

Usually when you buy something, you're asked whether your credit card number, phone number or answer to your most secret question is still correct. However, since someone could look over your shoulder, you don't want that shown on your screen. Instead, we mask it.

Your task is to write a function maskify, which changes all but the last four characters into '#'.

Examples
maskify('4556364607935616') # should return '############5616'
maskify('64607935616')      # should return '#######5616'
maskify('1')                # should return '1'
maskify('')                 # should return ''

# "What was the name of your first pet?"
maskify('Skippy')                                   # should return '##ippy'
maskify('Nananananananananananananananana Batman!') # should return '####################################man!'

=end

def maskify(cc)
  last_four = cc.chars.pop(4).join
  cc.chars[0..-5].map { |x| x = "#" }.join + last_four
end

puts maskify('4556364607935616') # should return '############5616'
puts maskify('64607935616')      # should return '#######5616'
puts maskify('1')                # should return '1'
puts maskify('')                 # should return ''
puts maskify('Nananananananananananananananana Batman!') # should return '####################################man!'
