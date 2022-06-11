# To-do:
# - Review alternative solutions
#   - https://github.com/iliebabcenco/enumerable-methods

module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    i = 0
    to_a.my_each do |element|
      yield element, i
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    arr = []
    to_a.my_each do |element|
      if yield element
        arr << element
      end
    end
    return arr
  end

  def my_all?(parameter = nil)
    to_a.my_each do |element|
      if block_given?
        return false unless yield element
      # Check if a pattern is supplied
      elsif parameter.instance_of? Class
        return false unless element.is_a? parameter
      else
        return false unless parameter.nil? ? element : parameter === element
      end
    end
    true
  end

  def my_any?(parameter = nil)
    to_a.my_each do |element|
      if block_given?
        return true if yield element
      elsif parameter.instance_of? Class
        return true if element.is_a? parameter
      else
        return true if parameter.nil? ? element : parameter === element
      end
    end
    false
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    for element in self # The result value of a for loop is the value
                        # iterated over unless break is used.
      yield element
    end
  end
end
