require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../invoicing/invoice'

class InvoiceTest < MiniTest::Test

  def test_is_number
    input = 1
    assert_equal true, input.is_a?(Integer)
  end

  def test_is_not_number
    input = "1"
    input = "watermelon"
    assert_equal false, input.is_a?(Integer)
    assert_equal false, input.is_a?(Integer)
  end

  def test_is_minimum_quantity
    watermelon_small_pack = 3
    input = 3
    assert_equal true, input >= watermelon_small_pack
  end

  def test_is_not_minimum_quantity
    watermelon_small_pack = 3
    input = 1
    assert_equal true, input < watermelon_small_pack
  end

end
