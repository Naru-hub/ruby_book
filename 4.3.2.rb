numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end
puts sum  #10

a = [1,2,3,1,2,3]
a.delete(2)
puts a    #[1,3,1,3]

a = [1,2,3,1,2,3]
a.delete_if do |n|
  n.odd?
end
puts a   #[2,2]

numbers = [1,2,3,4]
sum = 0
sum_value = 100
numbers.each do |sum_value|
  sum += sum_value
end
puts sum  #10

numbers = [1,2,3,4]
sum = 0
numbers.each {|n|
  sum += n
}
puts sum

numbers = [1,2,3,4,5]
new_numbers = []
numbers.each {|n|new_numbers << n * 10}
puts new_numbers   #[10,20,30,40,50]

numbers = [1,2,3,4,5,6]
even_numbers = numbers.select {|n| n.even?}
puts even_numbers  #[2,4,6]

numbers = [1,2,3,4,5,6]
non_multiples_of_three = numbers.reject {|n| n % 3 == 0}
puts non_multiples_of_three  #[1,2,4,5]
