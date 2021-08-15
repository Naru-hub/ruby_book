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