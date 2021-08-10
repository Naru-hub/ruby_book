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