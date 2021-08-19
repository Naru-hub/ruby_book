# エイリアスメソッド
class User
  def hello
    'Hello!'
  end

  # helloメソッドのエイリアスメソッドとしてgreetingを定義する
  alias greeting hello
end

user = User.new
puts user.hello   #Hello!
puts user.greeting   #Hello!


# メソッドの削除
class User
  # freezeメソッドの定義を削除する
  undef freeze
end

user = User.new
# freezeメソッドを呼び出すとエラーになる
# user.freeze       NoMethodError

# ネストしたクラスの定義
class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B')
puts blood_type.type   #B


class User
  # =で終わるメソッドを定義する
  def name=(value)
    @name = value
  end
end

user = User.new
# 変数に代入するような形式でname=メソッドを呼び出せる
user.name = 'Alice'

class Product
  attr_reader :code,:name

  def initialize(code,name)
    @code = code
    @name = name
  end

  def ==(other)
    if other.is_a?(Product)
      # 商品コードが一致すれば同じProductとみなす
      code == other.code
    else
      # otherがProductでなければ常にfalse
      false
    end
  end
end
# aとcが同じ商品コード
a = Product.new('A-0001','A great movie')
b = Product.new('B-0001','An awesome film')
c = Product.new('A-0001','A great movie')

# 商品コードが一致すればtrueになる
a == b  #false
a == c  #true

# Product以外の比較はfalse
a == 1    #false
a == 'a'  #false


# equal? メソッド(object_idが等しい場合にtrueを返します)
 a = 'abc'
 b = 'abc'
 a.equal?(b)  #false

 c = a
 a.equal?(c)  #true

#  == はオブジェクトの内容が等しいか判断する
1 == 1.0      #true

# eql? メソッドハッシュのキーとして2つのオブジェクトが等しいかどうかを判断する
# ハッシュ上では1と1.0は別々のキーとして扱われる
h = {1 => 'Inreger', 1.0 => 'Float'}
h[1]     #Inreger
h[1.0]   #Float
# 異なるキーとして扱われるのはeql？メソッドで比較した時にfalseになるため
1.eql?(1.0)  #false

# eql?メソッドを再定義した場合は「a.eql?(b)が真なら、a.hash == b.hashも真』となるようにhashメソッドも再定義しなければなりません
a = 'japan'
b = 'japan'
# eql?が真ならhash値も同じ
a.eql?(b)  #true
a.hash     #1975071775853178628
b.hash     #1975071775853178628

c = 1
d = 1.0
# eql?が偽ならhash値も異なる
c.eql?(d)  #false
c.hash     #1888656623054670106
d.hash     #-1928430720389354965


value = [1,2,3]
# 内部的には String ＝＝＝ value， Array === value、 Hash ===valueの結果が評価されている
case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when Hash
  puts 'ハッシュです'
end
#配列です


# Stirngクラスを継承した独自クラスを定義する
class MyString < String
  # Stringクラスを拡張するためのコードを書く
end
s = MyString.new('Hello')
puts s           #Hello
puts s.class     #MyString

# Arrayクラスを継承した独自クラスを定義する
class MyArray < Array
  # Arrayクラスを拡張するためのコードを書く
end
a = MyArray.new()
a << 1
a << 2
puts a   #[1,2]
puts a.class   #[MyArray]


class String
  # 文字列をランダムにシャッフルする
  def shuffle
    chars.shuffle.join
  end
end

s = 'Hello, Iam Alice'
puts s.shuffle   #"m,icaHol lele IA"
puts s.shuffle   #iHee,llo cm AlaI


# モンキーパッチ(既存の実装を上書きして自分が期待する挙動に変更する)
# 以下のUserクラスは外部ライブラリーで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end
# モンキーパッチをあてる前の挙動を確認する
user = User.new('Alice')
puts user.hello   #"Hello, Alice!"

# helloメソッドにモンキーパッチをあてて独自の挙動をもたせる
class User
  def hello
    "#{@name}さん、こんにちは！"
  end
end
# メソッドの定義を上書きしたのでhelloメソッドの挙動が変わっている
puts user.hello   #"Aliceさん、こんにちは！"

# 応用 既存のメソッドをエイリアスメソッドとして残し上書きしたメソッドの中で既存のメソッドを再利用することもできる
# 以下のUserクラスは外部ライブラリーで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello,#{@name}!"
  end
end

# モンキーパッチをあてるためにUserクラスを再オープンする
class User
  # 既存のhelloメソッドはhello_originalとして呼び出せるようにしておく
  alias hello_original hello
  # helloメソッドにモンキーパッチをあてる
  # (元々実装されていたhelloメソッドも再利用する)
  def hello
    "#{hello_original}じゃなくて、#{@name}さんこんにちは！"
  end
end

# モンキーパッチをあてたhelloメソッドの挙動を確認する
user = User.new('Alice')
puts user.hello #Hello,Alice!じゃなくて、Aliceさんこんにちは！
