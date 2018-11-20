require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'invoice'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class InvoiceTest < MiniTest::Test

end
