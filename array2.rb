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

# 元からブロック引数を2つ受け取る場合,ブロック引数を2つにすると第一引数で縦と横の値を配列として取得できる
dimensions = [
  [10,20],
  [30,40],
  [50,60],
]
# いったん配列のまま受け取る
dimensions.each_with_index do |dimension, i|
  # 配列から縦と横の値を取り出す
  length = dimension[0]
  width = dimension[1]
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# ブロック引数（縦の値、横の値、添字）の3つの値をブロック引数で受け取る(上より簡潔にかける)
dimensions = [
  [10,20],
  [30,40],
  [50,60],
]
# ブロック引数を()で囲んで、配列の要素を別々の引数として受け取る
dimensions.each_with_index do |(length, width),i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# ブロックの後ろに別のメソッドを続けて書く
names = ['田中','鈴木','佐藤']
puts san_names = names.map{|name| "#{name}さん"}.join('と')   #"田中さんと鈴木さんと佐藤さん"


# 繰り返し処理timesメソッド
sum = 0
# 処理を5回繰り返す。nには0,1,2,3,4が入る
5.times{|n| sum += n }
sum

# sumに1を加算する処理を5回繰り返す
sum = 0
5.times{sum += 1 }
sum

# uptoメソッド nからmまで数値を1ずつ増やしながら処理をする
a = []
10.upto(14){|n| a << n }
a        #[10,11,12,13,14]
# downtoメソッド(数値を減らしていく)
a = []
14.downto(10){|n| a << n }
a        #[14,13,12,11,10]

# stepメソッド(nからm個までx個ずつ増やしながら処理する)
# 開始値.step(上限値、1度に増減する大きさ)
# 1から10まで2ずつ値を増やしながら処理する
a = []
1.step(10,2){|n| a << n }
a        #[1,3,5,7,9]
# 10から1まで2つずつ値を減らす
a = []
10.step(1,-2){|n| a << n }
a         #[10,8,6,4,2]



