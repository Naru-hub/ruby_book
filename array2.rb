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

# while分繰り返し処理用の構文(指定した条件が真である間、処理を繰り返す)
# 配列の要素数が5つになるまで値を追加するwhile文
a = []
while a.size < 5
  a << 1
end
a       #[1,1,1,1,1]
# 条件式の後ろにdoを入れると1行で書くことも可能
a = []
while a.size < 5 do a << 1 end
a
# 更にスッキリ1行でかける
a = []
a << 1 while a.size < 5
a

# begin...endで囲みwhile どんな条件でも最低１回は実行したい場合
a = []
while false
  # このコードは常に条件が偽になるので実行されない
  a << 1
end
a        #[]
# begin...endで囲むとどんな条件でも最低１回は実行される
begin
  a << 1
end while false
a        #[1]

# whileの反対で、条件が偽である間、処理を繰り返すuntil文もある
# 配列の要素数が3以下になるまで配列の要素を後ろから削除していく
a = [10,20,30,40,50]
until a.size <= 3
  a.delete_at(-1)
end
a

# for文
numbers = [1,2,3,4]
sum = 0
for n in numbers
  sum += n
end
puts sum
# doを入れて1行で書くことも可
sum = 0
for n in numbers do sum += n end
sum
# for文は配列の要素を受け取る変数やfor文の中で作成したローカル変数がfor文の外でも使える
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10:n
  sum += sum_value
end
# ブロック引数やブロック内で作成した変数はブロックの外では参照できない
n
# sum_value  NameErrorになる


sum = 0
for n in numbers 
  sum_value = n.even? ? n * 10:n
  sum += sum_value
end
# for文の中で作成された変数はfor文の外でも参照できる
n           #4
sum_value   #40

# loopメソッド
# 配列に格納した5つの数値の中からランダムに数値を選び、5がでたタイミングで脱出する無限ループ
numbers = [1,2,3,4,5]
loop do
  # sampleメソッドでランダムに要素を1つ取得する
  n = numbers.sample
  n
  break if n == 5
end
# while文でループ
while true
  n = numbers.sample
  n
  break if n == 5
end

# breakを使うと繰り返し処理を脱出することができる
# shuffleメソッドで配列の要素をランダムに並び替える
numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  n
# 5が出たら繰り返しを脱出
break if n == 5
end
# whileで書き直す
numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end

# breakに引数を渡すとwhile文やfor文の戻り値になる。引数を渡さなければ戻り値はnil
ret = 
while true
  break
end
ret   #nil

ret = 
while true
  break 123
end
ret   #123

# 繰り返し処理が入れ子になっている場合は一番内側の繰り返し処理を脱出する
fruits = ['apple','melon','orange']
numbers = [1,2,3]
fruits.each do |fruit|
  # 配列の数字をランダムに入れ替え、3が出たらbreakする
  numbers.shuffle.each do |n|
    "#{fruit},#{n}"
    # numberのループは脱出するがfruitsのループは継続する
    break if n == 3
  end
end

# throwとcatch "orange"と3の組み合わせが出たらすべての繰り返し処理を脱出する
fruits = ['apple','melon','orange']
numbers = [1,2,3]
catch :done do
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        # すべての繰り返し処理を脱出する
        throw :done
      end
    end
  end
end

# next 繰り返し処理を途中で中断し、次の繰り返し処理にすすめる
# 偶数であれば処理を中断して次の繰り返し処理に進む
numbers = [1,2,3,4,5]
numbers.each do |n|
  # 偶然であれば中断して次の繰り返し処理に進む
  next if n.even?
  puts n
end

fruits = ['apple','melon','orange']
numbers = [1,2,3,4]
fruits.each do |fruit|
  numbers.each do |n|
    # 繰り返し処理が入れ子になっている場合は、一番内側のループだけが中断される
    next if n.even?
    puts "#{fruit}, #{n}"
  end
end    

# redo 繰り返し処理をやり直す
foods = ['ピーマン','トマト','セロリ']
count = 0
foods.each do |food|
  print "#{food}は好きですか？ =>"
  # わざと「いいえ」しか答えないようにする
  answer = 'いいえ'
  puts answer

  count += 1
  # やりなおしは2回までにする
  redo if answer != 'はい'&& count < 2
  
  # カウントをリセット
  count = 0
end