# 応用 既存のメソッドをエイリアスメソッドとして残し、上書きしたメソッドの中で既存のメソッドを再利用する事もできる
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
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end

# モンキーパッチをあてたhelloメソッドの挙動を確認する
user =  User.new('Alice')
puts user.hello     #Hello,Alice!じゃなくて、Aliceさん、こんにちは！


# クラスメソッドを定義するコード
class User
  def self.hello
    'Hello'
  end

  class << self
    def hi
      'Hi.'
    end
  end
end
# 特異メソッドを定義するコード例
alice = 'I am alice.'
def alice.hello
  'Hello.'
end

class << alice
  def hi
    'Hi.'
  end
end

class User
end
# クラス構文の外部でクラスメソッドを定義する方法1
def User.hello
  'Hello.'
end
# クラス構文の外部でクラスメソッドを定義する方法2
class << User
  def hi
    'Hi.'
  end
end

puts User.hello   #"Hello."
puts User.hi      #"Hi."

class Product
  def initialize(name,price)
    @name = name
    @price = price
  end

  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり':'なし'
    "商品: #{@name} 価格:#{@price}円 在庫: #{stock}"
  end
end


class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    # (本当はデータベースに問い合わせるなどの処理が必要だがここでは省略)
    true
  end
end

product = Product.new('A great film', 1000)
# スーパークラスはstock?メソッドを持たないのでエラーが起きる
# product.display_text    #NoMethodError

dvd = DVD.new('An awesome film', 3000)
#  サブクラスはstock?メソッドを持つのでエラーが起きない
puts dvd.display_text     #商品: An awesome film 価格:3000円 在庫: あり


def add_ten(n)
  # nが整数以外の場合にも対応するためto_iで整数変換する
  n.to_i + 10
end

# 整数を渡す
puts add_ten(1)  #11

# 文字列やnilを渡す
puts add_ten('2')   #12
puts add_ten(nil)   #10

# 引数にデフォルト値をつける
def add_numbers(a = 0,b = 0)
  a + b
end

# 引数の個数はゼロでも1個でも2個でもいい
puts add_numbers       #0
puts add_numbers(1)    #1
puts add_numbers(1,2)  #3
