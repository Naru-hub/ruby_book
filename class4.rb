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
puts a == b  #false
puts a == c  #true

# Product以外の比較はfalse
puts a == 1    #false
puts a == 'a'  #false