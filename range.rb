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
puts a[1..3]

# 文字列に対して範囲オブジェクトを渡すと指定した範囲の要素を取得する
a = 'abcdef'
# 2文字目から4文字目までを抜き出す
a[1..3]
