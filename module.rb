class Product
  def title
    log 'title is called.'
    'A great movie'
  end

  private

  def log(text)
    # 本来であれば標準ライブラリのLoggerクラスなどを使うべきだが簡易的にputsで済ませる
    puts "[LOG] #{text}"
  end
end

class User
  def name
    log 'name is called.'
    'Alice'
  end

  private

  # このメソッドの実装はProductクラスのlogメソッドと全く同じ
  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new   #[LOG]title is called.
product.title           #A great movie

user = User.new         #[LOG] name is called.
user.name               #Alice

# ログ出力用のメソッドを提供するモジュール
# 「ログ出力できる(log + able)』という意味でLoggableという名前をつけた
module Loggable
  # logメソッドはprivateメソッドにする
  def log(text)
    put "[LOG] #{text}"
  end
end

class Product
  # 上で作ったモジュールをincludeする
include Loggable
  def title
  #  logメソッドはLoggableモジュールで定義したメソッド
  log 'title is called.'
  'A great movie'
  end
end

class User
    # こちらも同じようにincludeする
  include Loggable

  def name
    # Loggableモジュールのメソッドが使える
    log 'name is called.'
    'Alice'
  end
end
puts product = Product.new   #[LOG] title is called.
puts product.title           #A great movie

puts user = User.new         #[LOG] name is called.
puts user.name               #Alice