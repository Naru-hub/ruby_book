# 配列[位置,取得する長さ]
# ２つ目の要素から3つ分の要素を取得する
a = [1,2,3,4,5]
a[1,3]

# values_atメソッド取得したい要素の添字を複数指定する
a = [1,2,3,4,5]
a.values_at(0,2,4)

# 「配列の長さ-1」すると最後の要素取得
a = [1,2,3]
a[a.size - 1]

a = [1,2,3]
# 最後の要素を取得する
[-1]

# 最後から２番目の要素を取得する
a[-2]

# 最後から２番目の要素から2つの要素を取得する
a[-2, 2]

# 配列lastメソッド 配列の最後の要素を取得できる（引数に0以上の数値を渡すと最後のn個の要素を取得）
a = [1,2,3]
a.last
a.last(2)

# firstメソッド 先頭の要素を取得
a = [1,2,3]
a.first
a.first(2)

# 開始位置と長さを指定して要素を置き換える
a = [1,2,3,4,5]
# 2つ目から3要素分を100で置き換える
a[1,3] = 100
a             #[1 100 5]

# pushメソッド 複数の値を追加できる
a = []
a.push(1)
a.push(2,3)

# deleteメソッド 指定した値に一致する要素を削除したい場合
a = [1,2,3,1,2,3]
# 値が2である要素を削除する(削除した値が戻り値になる)
a.delete(2)
a
# 存在しない値を指定するとnilが返る
a.delete(5)  #nil
a   #[1,3,1,3]


# concatメソッド 配列を連結する。元の配列（メソッドを呼び出した側の配列）が変更される
a = [1]
b = [2,3]
a.concat(b)  #[1,2,3]

# aは変更される(破壊的)
a  #[1,2,3]

# bは変更されない
b  #[2,3]

# +を使うと元の配列を変更せず新しい配列を作成する(通常はこちらを利用)
a = [1]
b = [2,3]
a + b  #[1,2,3]

# aもbも破壊されない
a  #[1]
b  #[2,3]

# |は和集合を求める演算子で2つの配列の要素をすべて集め重複しないようにして返す(元の配列は変更しない、非破壊的)
a = [1,2,3]
b = [3,4,5]
a | b  #[1,2,3,4,5]

# -は差集合を求める演算子で左の配列から右の配列に含まれる要素を取り除く(元の配列は変更しない、非破壊的)
a = [1,2,3]
b = [3,4,5]
a - b  #[1,2]

# &は積集合を求める演算子で2つの配列に共通する要素を返します(元の配列は変更しない、非破壊的)
a = [1,2,3]
b = [3,4,5]
a & b    #[3]

# Setクラス 配列よりも効率的に集合を扱える(本格的な集合演算をする場合はこっちを使う)
require 'set'

a = Set.new([1,2,3])
b = Set.new([3,4,5])
puts a | b  #<Set: {1,2,3,4,5}>
puts a - b  #<Set: {1,2}>
puts a & b  #<Set: {3}>

# 多重代入では左辺の変数より右辺の個数が多い場合はみ出した値が切り捨てられるが
e,f = 100,200,300
puts e
puts f
# 左辺の変数に*をつけると残りの全要素を配列として受け取る事ができる
e,*f = 100,200,300
puts e
puts f

# メソッドの引数に「１つ配列」ではなく配列を展開して「複数の引数」として渡したい場合、配列の前に*を置きます(splat展開)
a = []
b = [2,3]
a.push(1)
# 配列を*付きで追加する
a.push(*b)  #[1,2,3]


# 個数制限のない引数のことを可変長引数といい、メソッドで可変長引数を使いたい場合引数名の手前に*をつけます
def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end

puts greeting('田中さん')                                      #田中さん、こんにちは！
puts greeting('田中さん','鈴木さん')                           #田中さんと鈴木さん、こんにちは！
puts greeting('田中さん','鈴木さん','佐藤さん')                #田中さんと鈴木さんと佐藤さん、こんにちは！


# []の中に*付きで別の配列を置くとその配列が展開されて別々の要素になる(配列同士を非破壊的に連結する)splat展開
a = [1,2,3]
# []の中にそのまま配列を置くと配列の配列になる
[a]       #[[1,2,3]]
# *付きで配列を置くと展開されて別々の要素になる
[*a]      #[1,2,3]
# これを利用して別の配列を要素の一部とする新しい配列を作れる
a = [1,2,3]
[-1,0,*a,4,5]       #-1,0,1,2,3,4,5


# ==を使うと左辺と右辺の配列が等しいかどうかチェックできる
[1,2,3] == [1,2,3]
# 配列が等しくない場合
[1,2,3] == [1,2,4]
[1,2,3] == [1,2]
[1,2,3] == [1,2,3,4]


# []で文字列の配列を作成する
['apple','melon','orange']
# %wで文字列の配列を作成する(!で囲む場合)
%w!apple melon orange!
# %wで文字列の配列を作成する(!で囲む場合)
%w(apple melon orange)
# 空白文字(スペースや改行)が連続した場合も1つの区切り文字とみなされる
%w(
  apple
  melon
  orange
)       #上4例とも["apple", "melon", "orange"]となる


# charsメソッド文字列中の1文字1文字を配列の要素に分解する
puts 'Ruby'.chars

# splitメソッド引数で渡した区切り文字で文字列を配列に分割する
puts 'Ruby,Java,Perl,PHP'.split(',')


# Array.new配列に初期値を設定する
a = Array.new
# Array.newに引数を渡すとその個数分の要素が追加され初期値はnilになる(要素が5つの配列を作成する)
a = Array.new(5)
a     #[nil.nil.nil.nil.nil]
# さらに第2引数を指定するとnil以外の初期値を設定できる
# 要素が5つで0を初期値とする配列を作成する
a = Array.new(5,0)
a     #[0,0,0,0,0]

# 要素数が10で、1,2,3,1,2,3...と繰り返す配列を作る
a = Array.new(10){|n| n % 3 + 1}
a     #[1,2,3,1,2,3,1,2,3,1]

# 引数ではなくブロックで初期値を渡す
a = Array.new(5){'default'}
a         #["default","default","default","default","default"]
# 1番目の要素を取得する
str = a[0]
str  #"default"
# 1番目の要素を大文字に変換する（破壊的変更）
str.upcase!
str  #"DEFAULT"
# 1番目の要素だけが大文字になり、ほかは変わらない
a    #["DEFAULT","default","default","default","default"]


# 文字列は配列とは無関係なオブジェクトだが、[]や<<を使って配列と同じような操作をすることができる
a = 'abcde'
# 3文字目を取得する
a[2]
# 2文字目から3文字分を取得する
a[1,3]  #"bcd"
# 最後の1文字を取得する
a[-1]   #"e"

# 1文字目を"X"に置き換える
a[0] = 'X'
a      #"Xbcde"
# 2文字目から3文字分を"Y"に置き換える
a[1,3] = 'Y'
a      #"XYe"
# 末尾に"PQR"を連結する
a << 'PQR'
a      #"XYePQR"

# each_with_indexメソッド 添字付きの繰り返し処理
fruits = ['apple','orange','melon']
# ブロックの引数のiには0,1,2...と要素の添字が入る
fruits.each_with_index{|fruit,i| puts "#{i}: #{fruit}"}
#0:apple
#1:orange
#2:melon

# mapメソッド+with_indexメソッド
fruits = ['apple','orange','melon']
# mapとして処理しつつ、添字も受け取る
fruits.map.with_index{|fruit,i| "#{i}: #{fruit}"}

# delete_ifメソッドとwith_index
fruits = ['apple','orange','melon']
# 名前に"a"を含み、なおかつ添字が奇数である要素を削除する
puts fruits.delete_if.with_index{|fruit,i| fruit.include?('a') && i.odd? }  #["apple","melon"]
