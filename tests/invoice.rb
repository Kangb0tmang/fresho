# require 'pry'

def watermelons(quantity)
  puts "#{quantity} Watermelons $#{quantity * 8.99}"
end

puts "How many watermelons?"

input = gets.chomp.to_i
watermelons(input)

# binding.pry
