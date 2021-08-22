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


# モジュールをextendする
# モジュールの定義はincludeするときと同じ
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # Loggableモジュールのメソッドを特異メソッド(クラスメソッド)としてミックスインする
  extend Loggable

  def self.create_products(names)
    # logメソッドをクラスメソッド内で呼び出す
    #(つまりlogメソッド自体もクラスメソッドになっている)
    log 'create_products is called.'
    # 他の実装は省略
  end
end
# クラスメソッド経由でlogメソッドが呼び出される
puts Product.create_products([])     #[LOG] create_products is called.
# Productクラスのクラスメソッドとして直接呼び出すことも可能
puts Product.log('Hello.')           #[LOG] Hello.

class Product
  extend Loggable

  # logメソッドをクラスの構文の直下で呼び出す
  # (クラスが読みこまれるタイミングでこのlogメソッドも実行される)
  puts log 'Defined Product class.'
end
#[LOG] Defined Product class.


# includeされたモジュールの有無
module Loggable
  # 省略
end
class Product
  include Loggable
  # 省略
  end
  puts Product.include?(Loggable)    #true
  puts Product.included_modules      #[Loggable, Kernel]
  puts Product.ancestors             #[Product,Loggable,Object,Kernel,BasicObject]

product = Product.new
# product.classはProductクラスを返す
puts product.class.include?(Loggable)   #true
puts product.class.included_modules     #[Loggable,Kernel]

product = Product.new
# 引数が自クラス,includeしているモジュール、スーパークラスのいずれかに該当すればtrue
puts product.is_a?(Product)   #true
puts product.is_a?(Loggable)  #true
puts product.is_a?(Object)    #true


# include先のメソッドを使うモジュール
module Taggable
  def price_tag
    # priceメソッドはinclude先で定義されているはず、という前提
    "#{price}円"
  end
end

class Product
include Taggable
  def price
    1000
  end
end

puts product = Product.new
puts product.price_tag    #1000円

module Taggable
  def price_tag
    # あえてselfをつけて呼び出してもいい(privateメソッドでなければ)
    # selfはinclude先のクラス(たとえばProductクラス)のインスタンスになる
    "#{self.price}円"
  end
end


# Enumerableモジュール(配列やハッシュ、範囲(Range)など何かしらの繰り返し処理ができるクラスにincludeされているモジュールです
puts Array.include?(Enumerable)    #true
puts Hash.include?(Enumerable)     #true
puts Range.include?(Enumerable)    #true
puts [1,2,3].map {|n| n * 10}      #[10,20,30]
puts (1..3).map {|n| n * 10}       #[10,20,30]
# 配列、ハッシュ、範囲で countメソッドを使う
puts [1,2,3].count                 #3
puts [a: 1,b: 2,c: 3].count
puts (1..3).count                  #3


# Comparableモジュール
class Tempo
  include Comparable
  attr_reader :bpm
  # bpmはBeats Per Minuteの略で音楽の速さを表す単位
  def initialize(bpm)
    @bpm = bpm
  end
  
  # <=>はComparableモジュールで使われる演算子(メソッド)
  def <=>(other)
    if other.is_a?(Tempo)
      # bpm同士を＜＝＞で比較した結果を返す
      bpm <=> other.bpm
    else
      # 比較できない場合はnilを返す
      nil
    end
  end

  # inspectメソッドをオーバーライド
  def inspect
    "#{bpm}bpm"
  end
end
# このクラスを実際に使って大小関係を比較してみます
t_120 = Tempo.new(120)
t_180 = Tempo.new(180)
t_120 > t_180    #false
t_120 <= t_180   #true
t_120 == t_180   #false

tempos = [Tempo.new(180),Tempo.new(60),Tempo.new(120)]
tempos.sort

