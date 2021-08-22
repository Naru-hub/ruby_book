# ここはトップレベル
p self         #main
p self.class   #Object

class User
  # ここはクラスの内部
  p self        #User
  p self.class  #Class
end

class User
end
# Userクラス自身のクラスはClassクラス
puts User.class  #Class
# ClassクラスのスーパークラスはModuleクラス
puts Class.superclass

module Loggable
end

# Loggableモジュール自身のクラスはModuleクラス
puts Loggable.class  #Module
# ModuleクラスのスーパークラスはObjectクラス
puts Module.superclass  #Object


class User
  p self         #User
  p self.class   #Class
end

module Loggable
  p self         #Loggable
  p self.class   #Module
end

module NameChanger
  def change_name
    #include先のクラスのインスタンス変数を変更する
    @name = 'ありす'
  end
end

class User
  include NameChanger

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
puts user.name   #"alice"

# モジュールで定義したメソッドでインスタンス変数を書き換える
user.change_name
puts user.name    #"ありす"


module NameChanger
  def change_name
    # セッターメソッド経由でデータを変更する
    self.name = 'ありす'
  end
end

class User
  include NameChanger

  # ゲッターメソッドとセッターメソッドを用意する
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Userクラスの使い方は先程と同じ
user = User.new('alice')
user.change_name
puts user.name   #"ありす"

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

s = 'abc'

# 文字列は通常のlogメソッドをもたない
# s.log('Hello.')  #NoMethodError

# 文字列sにLoggableモジュールのメソッドを特異メソッドとしてミックスインする
s.extend(Loggable)

# Loggableモジュールのlogメソッドが呼び出せるようになる
puts s.log('Hello.')  #[LOG] HELLO.

