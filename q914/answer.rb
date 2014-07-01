require 'tbpgr_utils'

sample_numbers_a = [*1..10].shuffle
sample_numbers_b = [*1..10].shuffle
correct = true
logical_operators = %w{& | ^ >> <<}

logical_operators.product(logical_operators).each do |logical_operator|
  first_operator = logical_operator.first
  second_operator = logical_operator.last
  [sample_numbers_a, sample_numbers_b].together do |x, y|
    ret = eval "y ^ ( (x ^ y) #{first_operator} ( (y - x) #{second_operator} (8 - 1) ) );"
    correct = false unless ret == [x, y].max
  end
  print first_operator, ",", second_operator, "\n" if correct
  correct = true
end

__END__
answer: &,>>

tbpgr_utilsは自作の gem です。
https://github.com/tbpgr/tbpgr_utils
