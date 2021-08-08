# 添字を0以外の数値から開始させる
fruits = ['apple','orange','melon']
# eachで繰り返しつつ、1から始まる添字を取得する
# (each_with_indexメソッドには引数を渡せないため、each.with_index(1)の形で呼び出す)
fruits.each.with_index(1){|fruit,i| puts "#{i}: #{fruit}"}

# mapで処理しつつ、10から始まる添字を取得する
fruits.map.with_index(10){|fruit,i| puts "#{i}: #{fruit}"}


# 配列がブロック引数に渡される場合
dimensions = [
  #[縦,横]
  [10,20],
  [30,40],
  [50,60],
]
# 面積の計算結果を格納する配列
areas = []
# ブロック引数が1個であれば、ブロック引数の値が配列になる
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
puts areas   #[200,1200.3000]

# ブロックの値を2個にすると縦と横の値を別々に受け取ることができ、上のコードよりシンプルに書ける
dimensions = [
  #[縦,横]
  [10,20],
  [30,40],
  [50,60],
]
# 面積の計算結果を格納する配列
areas = []
# 配列の要素分だけブロック引数を用意すると、各要素の値が別々の変数に格納される
dimensions.each do |length, width|
  areas << length * width
end
puts areas

