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

