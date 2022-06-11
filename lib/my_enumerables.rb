module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    i = 0
    self.my_each do |element|
      yield element, i
      i += 1
    end
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
