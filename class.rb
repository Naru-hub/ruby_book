# userを表すデータをハッシュと配列で表す
users = []
users << {first_name:'Alice',last_name: 'Ruby',age: 20}
users << {first_name:'Bob',last_name: 'Python',age: 30}

# userのデータを表示する
users.each do |user|
  puts "氏名: #{user[:first_name]}#{user[:last_name]}、年齢:#{user[:age]}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30


# ユーザーのデータを作成
users = []
users << {first_name:'Alice',last_name: 'Ruby',age: 20}
users << {first_name:'Bob',last_name: 'Python',age: 30}
# 氏名を作成するメソッド
def full_name(user)
  "#{user[:first_name]}#{user[:last_name]}"
end

# userのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}、年齢:#{user[:age]}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30


# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name,last_name,age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

    # 氏名を作成するメソッド
  def full_name
    "#{first_name}#{last_name}"
  end
end

# ユーザのデータを作成する
users = []
users << User.new('Alice','Ruby',20)
users << User.new('Bob','Python',30)

# userのデータを表示する
users.each do |user|
  puts "氏名: #{user.full_name}、年齢:#{user.age}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30


# 「Alice Rubyさん、20歳』というユーザのオブジェクトを作る
alice = User.new('Alice','Ruby',20)
# 「Bob Pythonさん、30歳』というユーザのオブジェクトを作る
bob = User.new('Bob','Python',30)
# どちらもfull_nameメソッドを持つが、保持しているデータが異なるので戻り値は異なる
puts alice.full_name   #Alice Ruby
puts bob.full_name   #Bob Python

user = User.new('Alice','Ruby',20)
puts user.first_name  #Alice

# userの名前を(first_name)外部から取得したり変更する
class User
  # first_nameの読み書きを許可する
  attr_accessor :first_name
  # 省略
end
user = User.new('Alice','Ruby',20)
puts user.first_name  #Alice
# first_nameを変更する
user.first_name = 'ありす'
puts user.first_name  #"ありす"


class User
  def initialize
    puts 'Initialized.'
  end
end
User.new
# Initialized.

class User
  # インスタンスメソッドの定義
  def hello
    "Hello!"
  end
end
user = User.new
# インスタンスメソッドの呼び出し
puts user.hello   #"Hello!"

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    @name = name
  end

  def hello
    # インスタンス変数に保存されている名前を表示する
    "Hello,I am #{@name}."
  end
end 
user = User.new('Alice')
puts user.hello      #"Hello, Iam Alice."

# メソッドやブロックの内部で作成されるローカル変数
class User
  # 省略
  def hello
    # shuffled_nameはローカル変数
    shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}."
  end
end
user = User.new('Alice')
puts user.hello     #Hello, I am elciA.

#  インスタンス変数はクラスの外部から参照することはできない、参照したい場合は参照用のメソッドを作る
class User
  def initialize(name)
    @name = name
  end
  # @nameを外部から参照するためのメソッド
  def name
    @name
  end
end
user = User.new('Alice')
# nameメソッドを経由して@nameの内容を取得
puts user.name    #"Alice"

# インスタンス変数の内容を外部から変更したい場合も変更用のメソッドを定義
class User
  def initialize(name)
    @name = name
  end
  # @nameを外部から参照するためのメソッド
  def name
    @name
  end
  # @nameを外部から変更するためのメソッド
  def name=(value)
    @name = value
  end
end
user = User.new('Alice')
  # 変数に代入しているように見えるが実際はname=メソッドを呼び出している
user.name = 'Bob'
puts user.name    #Bob


# 上記のコードをattr_accessorで書き換え
class User
  # @nameを読み書きするメソッドが自動的に定義される
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  # nameメソッドやname=メソッドを明示的に定義する必要がない
end
user = User.new('Alice')
# @nameを変更する
user.name = 'Bob'
# @nameを参照する
puts user.name    #Bob


# インスタンス変数の内容を読み取り専用にしたい場合はattr_readerメソッドを使う
class User
  # 読み取り専用メソッドだけを自動的にする
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
user = User.new('Alice')
# @nameは省略できる
puts user.name    #"Alice"
# @nameを変更しようとするとエラーになる


# 書き込み専用にしたい場合attr_writerメソッドを使う
class User
  # 書き込み専用のメソッドだけを自動的に定義する
  attr_writer :name

  def initialize(name)
    @name = name
  end
end
user = User.new('Alice')
# @nameは変更できる
user.name = 'Bob'
# @nameの参照はできない


# カンマで複数の引数を渡すと複数のインスタンス変数に対するアクセサメソッドを作成することができる
class User
  # @nameと@ageへのアクセサメソッドを定義する
  attr_accessor :name,:age

  def initialize(name,age)
    @name = name
    @age = age
  end
end
user = User.new('Alice',20)
puts user.name      #"Alice"
puts user.age       #20


class User
  def initialize(name)
    @name = name
  end
  # これはインスタンスメソッド
  def hello
    # @nameの値はインスタンスによって異なる
    "Hello,I am #{@name}."
  end
end 
alice = User.new('Alice')
# インスタンスメソッドはインスタンス(オブジェクト)に対して呼び出す
puts alice.hello      #"Hello, Iam Alice."
bob = User.new('Bob')
# インスタンスのよって内部のデータが異なるのでhelloメソッドの結果も異なる
puts bob.hello        #"Hello, Iam Bob."


# class << selfからendの間にメソッドを書く
# クラスメソッドを定義する方法その2
class User
  def initialize(name)
    @name = name
  end

  # self.をつけるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end
  # これはインスタンメソッド
  def hello
    "Hello,I am #{@name}."
  end
end
names = ['Alice','Bob','Carol']
# クラスメソッドの呼び出し
users = User.create_users(names)
users.each do |user|
  # インスタンスメソッドの呼び出し
  puts user.hello
end
# Hello,I am Alice.
# Hello,I am Bob.
# Hello,I am Carol


# クラスの中には定数を定義できる
class Product
  # デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0
  attr_reader :name, :price
  def initialize(name,price = DEFAULT_PRICE)
    @name = name
    @price = price
  end 
end
product = Product.new('A free movie')
puts product.price   #0
