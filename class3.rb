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