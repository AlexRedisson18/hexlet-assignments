# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_element_addition
    stack = Stack.new
    element = 'element'

    stack.push!(element)

    assert_equal stack.to_a.last, element
    assert_equal stack.size, 1
  end

  def test_element_removing
    stack = Stack.new
    element1 = 'element1'
    element2 = 'element2'

    stack.push!(element1)
    stack.push!(element2)
    stack.pop!

    assert_equal stack.to_a.last, element1
    assert_equal stack.size, 1
  end

  def test_stack_cleaning
    stack = Stack.new
    element1 = 'element1'
    element2 = 'element2'

    stack.push!(element1)
    stack.push!(element2)
    stack.clear!

    assert_equal stack.size, 0
  end

  def test_stack_empty
    stack = Stack.new
    element1 = 'element1'
    element2 = 'element2'

    stack.push!(element1)
    stack.push!(element2)
    stack.clear!

    assert_empty stack.to_a
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
