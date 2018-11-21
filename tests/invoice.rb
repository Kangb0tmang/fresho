class Invoice

  def initialize
    @watermelon_subtotal
    @pineapple_subtotal
    @rockmelon_subtotal
  end

  def get_total
    total = @watermelon_subtotal + @pineapple_subtotal + @rockmelon_subtotal
    puts "Total $#{total.round(2)}"
  end

  def get_input(input, small_pack, fruit)
    while input < small_pack
      puts "Please enter #{small_pack} or more for #{fruit}"
      input = gets.chomp.to_i
    end

    calculate_fruit(input, fruit)
  end

  def calculate_fruit(input, fruit)
    if fruit == "watermelons"
      calculate_watermelons(input)
    elsif fruit == "pineapples"
      calculate_pineapples(input)
    elsif fruit == "rockmelons"
      calculate_rockmelons(input)
    end
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
    @watermelon_subtotal = large_packs + small_packs

    puts "#{quantity} Watermelons $#{large_packs + small_packs}"
  end

  def calculate_pineapples(quantity)
    remainder = quantity
    large_count = medium_count = small_count = 0
    large = 8
    medium = 5
    small = 2

    while remainder > 0
      if remainder >= large
        large_count += 1
        remainder = remainder - large
      elsif remainder.between?(medium, (large - 1))
        medium_count += 1
        remainder = remainder - medium
      elsif remainder.between?(small, (medium - 1))
        small_count += 1
        remainder = remainder - small
      elsif remainder < small
        break
      end
    end

    large_packs = large_count * 24.95
    medium_packs = medium_count * 16.95
    small_packs = small_count * 9.95
    @pineapple_subtotal = large_packs + medium_packs + small_packs

    puts "#{quantity} Pineapples $#{large_packs + medium_packs + small_packs}"
  end

  def calculate_rockmelons(quantity)
    remainder = quantity
    large_count = medium_count = small_count = 0
    large = 9
    medium = 5
    small = 3

    while remainder > 0
      if remainder >= large
        large_count += 1
        remainder = remainder - large
      elsif remainder.between?(medium, (large - 1))
        medium_count += 1
        remainder = remainder - medium
      elsif remainder.between?(small, (medium - 1))
        small_count += 1
        remainder = remainder - small
      elsif remainder < small
        break
      end
    end

    large_packs = large_count * 16.99
    medium_packs = medium_count * 9.95
    small_packs = small_count * 5.95
    @rockmelon_subtotal = large_packs + medium_packs + small_packs

    puts "#{quantity} Rockmelons $#{large_packs + medium_packs + small_packs}"
  end

end

puts "How many watermelons? (must be 3 or more)"
qty_watermelons = gets.chomp.to_i

puts "How many pineapples? (must be 2 or more)"
qty_pineapples = gets.chomp.to_i

puts "How many rockmelons? (must be 3 or more)"
qty_rockmelons = gets.chomp.to_i

watermelon_small = rockmelon_small = 3
pineapple_small = 2

order = Invoice.new
order.get_input(qty_watermelons, watermelon_small, "watermelons")
order.get_input(qty_pineapples, pineapple_small, "pineapples")
order.get_input(qty_rockmelons, rockmelon_small, "rockmelons")
order.get_total()
