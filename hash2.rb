h = Hash.new('hello')
a = h[:foo]    #"hello"
b = h[:bar]    #"hello"

# 変数aと変数bは同一オブジェクト
a.equal?(b)     #true

# 変数aに破壊的な変更を適用すると、変数bの値も一緒に変わってしまう
a.upcase!
a   #"HELLO"
b   #"HELLO"
# ハッシュ自身は空のままになっている
h   #{}

# 文字列や配列などミュータブルなオブジェクトを初期値として返す場合はHash.newとブロックを組み合わせて初期値を返すことで
# 上のような問題を避けることができる
# キーが見つからないとブロックがその都度実行されブロックの戻り値が初期値になる
h = Hash.new{'hello'}
a = h[:foo]    #"hello"
b = h[:bar]    #"hello"

# 変数aと変数bは異なるオブジェクト（ブロックの実行時に毎回新しい文字列が作成される）
a.equal?(b)  #false

# 変数aに破壊的な変更を適用しても変数bの値は変わらない
a.upcase!
a     #"HELLO"
b     #"hello"
# ハッシュは空のまま
h  #{}

# Hash.newにブロックを与えるとブロック引数としてハッシュ自身と見つからなかったキーが渡されます。
# そこでこのブロック引数を使ってハッシュと初期値も同時に設定するコードもよく使われます
# 初期値を返すだけでなくハッシュに指定されたキーと初期値を同時に設定する
h = Hash.new {|hash,key| hash[key] = 'hello'}
h[:foo]    #"hello"
h[:bar]    #"hello"

# ハッシュにキーと値が追加されている
h      #{:foo=>"hello",:bar=>"hello"}


# %記法でシンボルやシンボルの配列を作成する
# !を区切り文字に使う
%s!ruby is fun!      #:"ruby is fun"
# ()を区切り文字に使う
%s(ruby is fun)      #:"ruby is fun"

# シンボルの配列を作成する場合は%iを使うことができます。この場合空白文字が要素の区切りになります
%i(apple orange melon)   #[:apple, :orange, :melon]


# to_symメソッド(エイリアスメソッドはintern)を使うと文字列をシンボルに変換することができる
string = 'apple'
symbol = :apple

string.to_sym      #apple
string.to_sym == symbol    #true

# 反対にシンボルを文字列に変換する場合はto_sメソッド(エイリアスメソッドはid2name)を使う
string = 'apple'
symbol = :apple

symbol.to_s              #apple
string == symbol.to_s    #true
string + symbol.to_s     #appleapple

# メソッドによっては文字列とシンボルを同等に扱うものがあり、respond_to?メソッドはオブジェクトに対して
# 文字列またはシンボルで指定した名前のメソッドを呼び出せるかどうかを調べられる
# respond_to?メソッドの引数には文字列とシンボルの両方を渡せる
'apple'.respond_to?('include?')  #true
'apple'.respond_to?('include?')  #true

'apple'.respond_to?('foo_bar')  #false
'apple'.respond_to?('foo_bar')  #false

# 文字列とシンボルを同等に扱うかどうかはメソッドの仕様により、
# 一般的には同等に扱わない(文字列とシンボルを区別する)ケースのほうが多い
# 文字列に'pp'が含まれるか調べる
puts 'apple'.include?('pp')   #true
puts 'apple'.include?(:pp)   #TypeError
