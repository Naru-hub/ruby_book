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

numbers = [1,2,3,4,5,6]
even_number = numbers.find {|n| n.even?}
puts even_number   #2

numbers = [1,2,3,4]
sum = 0
numbers.each {|n|sum += n}
puts sum   #10

numbers = [1,2,3,4]
sum = numbers.inject(0) {|result,n| result + n}
puts sum  #10

weekly = ['Mon', 'Tue','Wed','Thu', 'Fri','Sat'].inject('Sun'){|result, s| result + s}
puts weekly   #SunMonTueWedThuFriSat

p = ['ruby','java','perl'].map(&:upcase)
puts p   #[RUBY, JAVA, PERL]

sum = [1,2,3,4,5,6].select(&:odd?)
puts sum   #[1,3,5]

a = [1,2,3,4,5]
puts a[1..3]    #[2,3,4]

a = 'abcdef'
puts a[1..3]    #bcd

def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
  puts charge(3)  #0
  puts charge(12)  #300
  puts charge(16)  #600
  puts charge(25)  #1000

  puts (1..5).to_a    #[1,2,3,4,5]
  puts (1...5).to_a   #[1,2,3,4]

  puts ('a'..'e').to_a    #[a,b,c,d,e]
  puts ('a'...'e').to_a   #[a,b,c,d]

  puts ('bad'..'bag').to_a   #[bad,bae,baf,bag]
  puts ('bad'...'bag').to_a  #[bad,bae,baf]

  puts [*1..5]    #[1,2,3,4,5]
  puts [*1...5]   #[1,2,3,4]