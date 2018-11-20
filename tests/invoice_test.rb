require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'invoice'

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

end
