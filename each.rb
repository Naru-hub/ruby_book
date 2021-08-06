numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end

puts sum

# each意外のブロック deleteメソッド 引数で渡した値に完全一致する要素を削除
a = [1,2,3,1,2,3]
# 配列から値が2の要素を削除
a.delete(2)

puts a

# 「奇数だけを削除する」delete_ifメソッド
a = [1,2,3,1,2,3]
# 配列から値が奇数の要素を削除する
a.delete_if do |n|
  n.odd?
end

puts a

# 偶数のみ値を10倍にしてから加算させるコード（条件分岐に条件演算子を利用）
number = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
puts sum

# do...endと{}
numbers = [1,2,3,4]
sum = 0
numbers.each { |n| sum += n }
puts sum

# map/collect
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each {|n| new_numbers << n * 10 }
puts new_numbers

# selectメソッド 各要素に対してブロックを評価し、その戻り値が真の要素を集めた配列を返す
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素だけが集められる(偶数の数値だけを集めた配列を返す)
even_numbers = numbers.select { |n| n.even?}
puts even_numbers

# rejectメソッド ブロックの戻り値が真になった要素を除外した配列を返す(ブロックの戻り値が偽である要素を集めるメソッド)
numbers = [1,2,3,4,5,6]
# 3の倍数を除外する(3の倍数以外を集める)
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
puts non_multiples_of_three
