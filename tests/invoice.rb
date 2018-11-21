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

  def calculate_packs(pricing)
    if pricing[:large][:count] > 0
      puts "#{pricing[:large][:count]}x #{pricing[:large][:pack]} pack @ $#{pricing[:large][:price]}"
    end

    if pricing[:medium][:count] > 0
      puts "#{pricing[:medium][:count]}x #{pricing[:medium][:pack]} pack @ $#{pricing[:medium][:price]}"
    end

    if pricing[:small][:count] > 0
      puts "#{pricing[:small][:count]}x #{pricing[:small][:pack]} pack @ $#{pricing[:small][:price]}"
    end
  end

  def calculate_subtotals(pricing, quantity, fruit)
    if fruit == "watermelons"
      large = pricing[:large][:count] * pricing[:large][:price]
      small = pricing[:small][:count] * pricing[:small][:price]
      @watermelon_subtotal = large + small
      puts "#{quantity} #{fruit.capitalize} $#{@watermelon_subtotal}"
    elsif fruit == "pineapples"
      large = pricing[:large][:count] * pricing[:large][:price]
      medium = pricing[:medium][:count] * pricing[:medium][:price]
      small = pricing[:small][:count] * pricing[:small][:price]
      @pineapple_subtotal = large + medium + small
      puts "#{quantity} #{fruit.capitalize} $#{@pineapple_subtotal}"
    elsif fruit == "rockmelons"
      large = pricing[:large][:count] * pricing[:large][:price]
      medium = pricing[:medium][:count] * pricing[:medium][:price]
      small = pricing[:small][:count] * pricing[:small][:price]
      @rockmelon_subtotal = large + medium + small
      puts "#{quantity} #{fruit.capitalize} $#{@rockmelon_subtotal}"
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

    pricing = {
      :large => {
        :count => large_count,
        :pack => large,
        :price => 8.99
      },
      :medium => {
        :count => 0
      },
      :small => {
        :count => small_count,
        :pack => small,
        :price => 6.99
      }
    }

    calculate_subtotals(pricing, quantity, "watermelons")
    calculate_packs(pricing)
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

    pricing = {
      :large => {
        :count => large_count,
        :pack => large,
        :price => 24.95
      },
      :medium => {
        :count => medium_count,
        :pack => medium,
        :price => 16.95
      },
      :small => {
        :count => small_count,
        :pack => small,
        :price => 9.95
      }
    }

    calculate_subtotals(pricing, quantity, "pineapples")
    calculate_packs(pricing)
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

    pricing = {
      :large => {
        :count => large_count,
        :pack => large,
        :price => 16.99
      },
      :medium => {
        :count => medium_count,
        :pack => medium,
        :price => 9.95
      },
      :small => {
        :count => small_count,
        :pack => small,
        :price => 5.95
      }
    }

    calculate_subtotals(pricing, quantity, "rockmelons")
    calculate_packs(pricing)
  end

end

watermelon_small = rockmelon_small = 3
pineapple_small = 2

puts "How many watermelons? (must be #{watermelon_small} or more)"
qty_watermelons = gets.chomp.to_i

puts "How many pineapples? (must be #{pineapple_small} or more)"
qty_pineapples = gets.chomp.to_i

puts "How many rockmelons? (must be #{rockmelon_small} or more)"
qty_rockmelons = gets.chomp.to_i

order = Invoice.new
order.get_input(qty_watermelons, watermelon_small, "watermelons")
order.get_input(qty_pineapples, pineapple_small, "pineapples")
order.get_input(qty_rockmelons, rockmelon_small, "rockmelons")
order.get_total()
