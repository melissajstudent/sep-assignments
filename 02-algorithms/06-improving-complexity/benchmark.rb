require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

array1 = (1..250).to_a.shuffle!
array2 = (1..250).to_a.shuffle!
array3 = (1..250).to_a.shuffle!

array4 = (1..1000).to_a.shuffle!
array5 = (1..1000).to_a.shuffle!
array6 = (1..1000).to_a.shuffle!

Benchmark.bm(100) do |x|
  x.report('original 250:')  {poorly_written_ruby(array1, array2, array3)}
  x.report('improving_complexity_version_one 250:') {poorly_written_ruby(array1, array2, array3)}
  x.report('improving_complexity_version_two 250:')  {poorly_written_ruby(array1, array2, array3)}
  x.report('improving_complexity_version_three 250:')    {heap_sort(array1, array2, array3)}
  puts "---------------------------------"
  x.report('original 1k:')  {poorly_written_ruby(array4, array5, array6)}
  x.report('improving_complexity_version_one 1k:') {poorly_written_ruby(array4, array5, array6)}
  x.report('improving_complexity_version_two 1k:')  {poorly_written_ruby(array4, array5, array6)}
  x.report('improving_complexity_version_three 1k:')    {heap_sort(array4, array5, array6)}
end
