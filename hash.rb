currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}
# イタリアの通貨を追加
currencies['italy'] = 'euro'
currencies

# すでにキーが存在していた場合は値が上書きされる
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}
# 既存の値を上書きする
currencies['japan'] = '円'
currencies

# ハッシュから値を取り出す
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}
currencies['india']

# 存在しないキーを指定するとnilが返る
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}
currencies['brazil']

# ハッシュを使った繰り返し処理
# キーと値で2個になっている
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}

currencies.each do |key, value|
  puts "#{key} : #{value}"
end

# ブロック引数を1つするとキー値が配列に格納される
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end

# == でハッシュ同士を比較すると同じハッシュかどうかをチェックできこのときすべてのキーと値が同じであればtrueが返る
a = {'x' => 1, 'y' => 2, 'z' => 3}
# すべてのキーと値が同じであればtrue
b = {'x' => 1, 'y' => 2, 'z' => 3}
puts a == b
# 並び順が異なっていてもキーと値がすべて同じならtrue
c = {'z' => 3, 'y' => 2, 'x' => 1}
puts a == c
# キー'x'の値が異なるのでfalse
d = {'x' => 10, 'y' => 2, 'z' => 3}
puts a == d

# sizeメソッド(エイリアスメソッドはlength)を使うとハッシュの要素の個数を調べられる
 {}.size   #0
 {'x' => 1, 'y' => 2, 'z' => 3}.size  #3

# deleteメソッドを使うと指定したキーに対応する要素を削除できる。戻り値は削除された要素の値です。
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.delete('japan')
puts currencies       #{"us" => "dollar", "india" => "rupee"}

# deleteメソッドで指定したキーがなければnilが返り、ブロックを渡すとキーが見つからない時にブロックの戻り値をdeleteメソッドの戻り値にできる。
currencies = {'japan' => 'yen','us' => 'dollar','india' => 'rupee'}
# 削除しようとしたキーが見つからないときはnilが返る
currencies.delete('italy')  #nil
puts currencies.delete('italy') {|key| "Not found: #{key}"} #=> "Not found: italy"

# ハッシュのキーにシンボルを使う
currencies = {:japan => 'yen', :us => 'dollar', :india => 'rupee'}
# シンボルを使って値を取り出す
puts currencies[:us]
# 新しいキーと値の組み合わせを追加する
currencies[:italy] = 'euro'

# => ではなく、"シンボル:値"の記法でハッシュを作成する
currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
# 値を取り出すときは同じ
puts currencies[:us]
# キーも値もシンボルの場合
{japan: :yen, us: :dollar, india: :rupee}
# 上のハッシュと下のハッシュは全く同じ
{:japan => :yen, :us =>:dollar, :india => :rupee }

# キーや値に異なるデータ型を混在させる
# 文字列のキーとシンボルのキーを混在させる
hash = {'abc' => 123, def: 456}
# 値を取得する場合はデータ型を合わせてキーを指定する
puts hash['abc']  #123
puts hash[:def]   #456
# データ型が異なると値は取得できない
puts hash[:abc]   #nil

# ハッシュに格納する値に関して異なるデータ型が混在するケース
person = {
  # 値が文字列
  name: 'Alice',
  # 値が数値
  age: 20,
  # 値が配列
  friends: ['Bob','Carol'],
  # 値がハッシュ
  phones: {home: '1234-0000', mobile: '5678-0000'}
}

puts person[:age]
puts person[:friends]
puts person[:phones][:mobile]

