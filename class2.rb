class User
end

user = User.new
puts user.class   #User

user = User.new
# userはUserクラスのインスタンスか？
puts user.instance_of?(User)     #true

# userはStringクラスのインスタンスか？
puts user.instance_of?(String)   #false

user = User.new
# instance_of?はクラスが全く同じでなければtrueにならない
puts user.instance_of?(Object)   #false

# is_a?はis_a関係にあればtrueになる
puts user.is_a?(User)           #true
puts user.is_a?(Object)         #true
puts user.is_a?(BasicObject)    #true

# is_aに関係ない場合はfalse
puts user.is_a?(String)         #false


class Product
  attr_reader :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end
end
product = Product.new('A great movie', 1000)
puts product.name    #"A great movie"
puts product.price   #1000

class DVD < Product
  # nameとpriceはスーパークラスでattr_readerが設定されているので定義不要
  attr_reader :running_time

  def initialize(name,price,running_time)
    # スーパークラスにも存在している属性
    @name = name
    @price = price
    # DVDクラス独自の属性
    @running_time = running_time
  end
end
dvd = DVD.new('A great movie', 1000, 120)
puts dvd.name              #"A great movie"
puts dvd.price             #1000
puts dvd.running_time      #120

class DVD < Product
  def initialize(name,price)
    # 引数をすべてスーパークラスのメソッドに渡す。つまりsuper(name,price)と書いたのと同じ
    super
    # サブクラスで必要な初期化処理を書く
  end
end
dvd = DVD.new('A great movie', 1000)
puts dvd.name   #"A great movie"
puts dvd.price  #1000


class Product
  attr_reader :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name,price,running_time)
    super(name,price)
    @running_time = running_time
  end

  def to_s
    # superでスーパークラスのto_sメソッドを呼び出す
    "#{super}, running_time: #{running_time}"
  end
end
product = Product.new('A great movie', 1000)
puts product.to_s      #"name: A great movie, price: 1000"
dvd = DVD.new('An awesome film', 3000, 120)
puts dvd.to_s          #"name: An awesome film, price: 3000, running_time: 120"


class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end
# Fooを継承したBarでもクラスメソッドのhelloが呼び出せる
puts Foo.hello   #hello
puts Bar.hello   #hello


class User
  # デフォルトはpublic
  def hello
    'Hello!'
  end
end
user = User.new
# publicメソッドなのでクラスの外部から呼び出せる
user.hello   #"Hello!"

class User
    # ここから下で定義されたメソッドはprivate
  private

  def hello
    'Hello!'
  end
end
user = User.new
# privateメソッドなのでクラスの外部から呼び出せない
user.hello  #NoMethodError
