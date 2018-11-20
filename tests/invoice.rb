# require 'pry'

class Invoice

  def initialize
  end

  def watermelons(quantity)
    puts "#{quantity} Watermelons $#{quantity * 8.99}"
  end

end

puts "How many watermelons?"

input = gets.chomp.to_i
order = Invoice.new
order.watermelons(input)

# binding.pry
