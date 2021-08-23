# AwesomeApiモジュールは設定を保持する(用途その１)
module AwesomeApi
  @base_url = ""
  @debug_mode = false

  class << self
    attr_accessor :base_url,:debug_mode
  end
end

# こちらではAwesomwApiモジュールが名前空間として使われる(用途２)
module AwesomeApi
  class Engine
    # クラスの定義
  end
end


module A
  def to_s
    "<A> #{super}"
  end
end

module B
  def to_s
    "<B> #{super}"
  end
end

class Product
  def to_s
    "<Product> #{super}"
  end
end

class DVD < Product
  include A
  include B

  def to_s
    "<DVD> #{super}"
  end
end
dvd = DVD.new
puts dvd.to_s      #"<DVD> <B> <A> <Product>"
puts DVD.ancestors #[DVD,B,A,Product,Object,Kernel,BasicObject]


module Greeting
  def hello
    'hello.'
  end
end

module Aisatsu
  # 別のモジュールをincludeする
  include Greeting

  def konnichiwa
    'こんにちは。'
  end
end

class User
  #Aisatsuモジュールだけをincludeする
  include Aisatsu
end
user = User.new
# Aisatsuモジュールのメソッドを呼び出す
puts user.konnichiwa   #こんにちは。
# Greetingモジュールのメソッドを呼び出す
puts user.hello        #hello.
puts User.ancestors    #[User,Aisatsu,Greeting,Object,Kernel,BasicObject]


# prependでモジュールをミックスインする
module A
  def to_s
    "<A> #{super}"
  end
end

class Product
# includeではなくprependを使う
include A
  def to_s
    "<Product> #{super}"
  end
end
product = Product.new
puts product.to_s  #<A> <Product> #<Product:0x00007f9ba415af30>
# prependではなくincludeでモジュールAをミックスインした場合
puts product.to_s  #<Product> <A> #<Product:0x00007f8bc70cae18>

# prependの場合
puts Product.ancestors   #[A,Product,Object,Kernel,BasicObject]
# includeの場合
puts Product.ancestors   #[Product,A,Object,Kernel,BasicObject]


# prependで既存メソッドを置き換える
# 以下のProductクラスは外部ライブラリで定義されている想定
class Product
  def name
    "a great film"
  end
end


# prependするためのモジュールを定義する
module NameDecorator
  def name
    # prependするとsuperはミックスインした先のクラスのnameメソッドを呼び出す
    "<<#{super}>>"
  end
end
# 既存メソッドを変更するためにProductクラスを再オープンする
class Product
  # includeではなくprependでミックスインする
  prepend NameDecorator
end
# エイリアスメソッドを使った場合と同じ結果が得られる
product = Product.new
puts product.name     #<<a great film>>

# Productクラスと同じようにnameメソッドを持つクラスがあったとする
class User
  def name
    'Alice'
  end
end

class User
  # prependを使えばUserクラスのnameメソッドも置き換えることができる
  prepend NameDecorator
end

# Userクラスのnameメソッドを上書きすることができた！
user = User.new
puts user.name    #<<Alice>>
Product.prepend NameDecorator
User.prepend NameDecorator



# 有効範囲を限定できるrefinements
module StringShuffle
  # refinementsが目的なのでrefineメソッドを使う
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end
# 通常はStringクラスにshuffleメソッドはない
#'Alice'.shuffle     #NoMethodError
class User
  # refinementsを有効化する
  using StringShuffle

  def initialize(name)
    @name = name
  end

  def shuffled_name
    # Userクラスの内部であればStringクラスのshuffleメソッドが有効になる
    @name.shuffle
  end
  # userクラスを抜けるとrefinementsは無効になる
end

user = User.new('Alice')
# Userクラス内ではshuffleメソッドが有効になっている
puts user.shuffled_name    #eAcli