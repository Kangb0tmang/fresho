class Invoice

  def initialize
  end

  def calculcate_watermelons(quantity)
    large_count = small_count = 0
    large = 5
    small = 3

    while quantity > 0
      if quantity >= large
        large_count += 1
        quantity = quantity - large
      elsif quantity.between?(small, (large - 1))
        small_count += 1
        quantity = quantity - small
      elsif quantity < small
        break
      end
    end

    large_packs = large_count * 8.99
    small_packs = small_count * 6.99

    puts "#{quantity} Watermelons $#{large_packs + small_packs}"
  end

end

puts "How many watermelons? (must be 3 or more)"
input = gets.chomp.to_i
order = Invoice.new
order.calculcate_watermelons(input)
