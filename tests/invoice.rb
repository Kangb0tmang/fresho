class Invoice

  def initialize
  end

  def get_input(input)
    watermelon_small_pack = 3

    while input < watermelon_small_pack
      puts "Please enter in 3 or more"
      input = gets.chomp.to_i
    end

    calculate_watermelons(input)
  end

  def calculate_watermelons(quantity)
    remainder = quantity
    large_count = small_count = 0
    large = 5
    small = 3

    while remainder > 0
      if remainder >= large
        large_count += 1
        remainder = remainder - large
      elsif remainder.between?(small, (large - 1))
        small_count += 1
        remainder = remainder - small
      elsif remainder < small
        break
      end
    end

    large_packs = large_count * 8.99
    small_packs = small_count * 6.99

    puts "#{quantity} Watermelons $#{large_packs + small_packs}"
  end

end

puts "How many watermelons? (must be 3 or more)"
watermelons = gets.chomp.to_i

order = Invoice.new
order.get_input(watermelons)
