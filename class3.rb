# privateメソッドはサブクラスでも呼び出せる
class Product
  def to_s
    # nameは常に"A great movie"になる、とは限らない
    "name: #{name}"
  end

  private

  def name
    'A great mobvie'
  end
end

class DVD < Product
  private
  # スーパークラスのprivateメソッドをオーバーライドする
  def name
    'An awesome film'
  end
end
product = Product.new
# Productクラスのnameメソッドが使われる
puts product.to_s    #"name: A great movie"
dvd = DVD.new
# オーバーライドしたDVDクラスのnameメソッドが使われる
puts dvd.to_s        #"name: An awesome film"


# privateメソッドになるのはインスタンスメソッドだけでクラスメソッドはprivate下に定義してもprivateにならない
class User
  private

  # クラスメソッドもprivateメソッドになる？
  def self.hello
    'Hello!'
  end
end
# クラスメソッドはprivateメソッドにならない
puts User.hello    #"Hello!"

# クラスメソッドをprivateにしたい場合class << selfの構文を使う
class User
  class << self
    # class << selfの構文ならクラスメソッドでもprivateが機能する
    private

    def hello
      'Hello!'
    end
  end
end
# User.hello   #NoMethodError


# protectedメソッド
class User
  # weightは外部に公開しない
  attr_reader :name

  def initialize(name,weight)
    @name = name
    @weight = weight
  end

  # 自分がother_usrより重い場合はtrue
  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  # protectedメソッドなので同じクラスかサブクラスであればレシーバ付きで呼び出せる
  def weight
    @weight
  end
end
alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

puts alice.heavier_than?(bob)  #false
puts bob.heavier_than?(alice)  #true


class Product
  DEFAULT_PRICE = 0
  # 再代入して定数の値を書き換える
  DEFAULT_PRICE = 1000
end
# 再代入の値が返る
Product::DEFAULT_PRICE    #1000

Product::DEFAULT_PRICE = 3000
Product::DEFAULT_PRICE    #3000


class Product
  NAME = 'A product'
  SOME_NAMES = ['Foo','Bar','Baz']
  SOME_PRICES = {'Foo' => 1000, 'Bar' => 2000, 'Baz' => 3000}
end

# 文字列を破壊的に大文字に変更する
Product::NAME.upcase!
puts Product::NAME  #A PRODUCT

# 配列に新しい要素を追加する
Product::SOME_NAMES << 'Hoge'
puts Product::SOME_NAMES   #["Foo","Bar","Baz","Hoge"]

# ハッシュに新しいキーと値を追加する
Product::SOME_PRICES['Hoge'] = 4000
puts Product::SOME_PRICES   #{"Foo"=>1000, "Bar"=>2000, "Baz"=>3000, "Hoge"=>4000}


class Product
  # 配列を凍結する
  SOME_NAMES = ['Foo','Bar','Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    # freezeしている配列に対しては破壊的な変更はできない
    names.delete('Foo')
    names
  end
end
# エラーが発生するのでうっかり定数の値が変更される自己が防げる
# Product.names_without_foo


# mapメソッドで各要素をfreezeし、最後にmapメソッドの戻り値の配列をfreezeする
SOME_NAMES = ['Foo','Bar','Baz'].map(&:freeze).freeze


class Product
  # クラスインスタンス変数
  @name =  'Product'

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
     # インスタンス変数
     @name
  end
end

class DVD < Product
  @name = 'DVD'
  def self.name
    # クラスインスタンス変数を参照
    @name
  end 

  def upcase_name
     # インスタンス変数を参照
    @name.upcase
  end
end

puts Product.name   #Product
puts DVD.name       #DVD

product = Product.new('A great movie')
puts product.name   #A great movie

dvd = DVD.new('An awesome film')
# dvd.name            #An awesome film
puts dvd.upcase_name  #AN AWESOME FILM
puts Product.name     #Product
puts DVD.name         #DVD


# グローバル変数
# グローバル変数の宣言と値の代入
$program_name = 'Awesome Program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameにはすでに名前が代入されている
puts Program.name   #Awesome Program

program = Program.new('Super program')
puts program.name   #Super program

# Program.newのタイミングで$program_nameが"Super program"に変更される
puts Program.name   #Super program
puts $program_name  #Super program

