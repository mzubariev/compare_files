require "compare_files/version"
require "active_support/core_ext/string"

module CompareFiles
  class Base

    def initialize(file1, file2)
      @file1array = array_from_file_lines(file1)
      @file2array = array_from_file_lines(file2)
    end

    def compare
      @result_array = []

      (0...max_arrays_length).each do |i|
        make_result_array(@file1array[i], @file2array[i])
      end

      print_result
    end

    private

    def array_from_file_lines(file_path)
      IO.readlines(file_path).map(&:chomp)
    end

    def max_arrays_length
      instance_arrays = []

      self.instance_variables.each do |inst_var|
        instance_arrays << self.instance_variable_get(inst_var)
      end

      instance_arrays.map(&:length).max
    end

    def make_result_array(arr1value, arr2value)
      case
        when arr1value.blank? && arr2value.blank? then return
        when arr1value.present? && arr2value.blank? then @result_array << "-   #{arr1value}"
        when arr1value.blank? && arr2value.present? then @result_array << "+   #{arr2value}"
        when arr1value == arr2value then @result_array << "    #{arr1value}"
        when arr1value != arr2value then @result_array << "*   #{arr1value} | #{arr2value}"
      end
    end

    def print_result
      @result_array.each_with_index { |arr, index| puts "#{index+1}   #{arr}" }
    end

  end
end
