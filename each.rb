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