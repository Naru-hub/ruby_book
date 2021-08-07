# ..を使うと5が範囲に含まれる（１以上５以下）
range = 1..5
range.include?(0)  #false
range.include?(1)
range.include?(4.9)
range.include?(5)
range.include?(6)  #false

# ...を使うと5が範囲に含まれない(1以上5未満)
range = 1...5
range.include?(0)     #false
range.include?(1)
range.include?(4.9)
range.include?(5)     #false
range.include?(6)     #false

# 配列に対して範囲オブジェクトを渡すと指定した範囲の要素を取得する
a = [1,2,3,4,5]
# 2番目から4番目までの要素を取得する
a[1..3]

# 文字列に対して範囲オブジェクトを渡すと指定した範囲の要素を取得する
a = 'abcdef'
# 2文字目から4文字目までを抜き出す
a[1..3]

# 不等号を使う場合
def liquid?(temperature)
  # 0度以上100度未満であれば液体、と判定したい
  0 <= temperature && temperature < 100
end

liquid?(-1)        #false
liquid?(0)
puts liquid?(99)
puts liquid?(100)  #false

# 範囲オブジェクトを使う場合
def liquid?(temperature)
  (0...100).include?(temperature)
end

puts liquid?(-1)      #false
puts liquid?(0)
puts liquid?(99)
puts liquid?(100)     #false


# 範囲オブジェクトをcase文で使う
def charge(age)
  case age
  # 0歳から5歳まで
  when 0..5
    0
  # 6歳から12歳までの場合
  when 6..12
    300
  # 13歳から18歳までの場合
  when 13..18
    600
  # それ以外
  else
    1000
  end
end

puts charge(3)
puts charge(12)
puts charge(16)
puts charge(25)

# to_aメソッドで値が連続する配列を作成
(1..5).to_a
(1...5).to_a

('a'..'e').to_a
('a'...'e').to_a

puts ('bad'..'bag').to_a
puts ('bad'...'bag').to_a

# *を使って複数の値を配列に展開するsplat展開
[*1..5]
[*1...5]

# 範囲オブジェクトを配列に変換してから繰り返し処理を行う
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }

puts sum  #10

# 配列に変換せず範囲オブジェクトに対して直接eachメソッドを呼び出す
sum = 0
(1..4).each{ |n| sum += n }

puts sum

# stepメソッドを呼び出し値を増やす感覚を指定
numbers = []
# 1から10まで2つ飛ばしで繰り返し処理を行う
(1..10).step(2) { |n| numbers << n }
puts numbers


