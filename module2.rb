module Baseball
  # これはBaseballモジュールに属するSecondクラス
  class Second
    def initialize(player,uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end

  module Clock
    # これはClockモジュールに属するSecondクラス
    class Second
      def initialize(digits)
        @digits = digits
      end
    end
  end

  # 二塁手のAliceを作成する
  Baseball::Second.new('Alice',13)

  # 時計の13秒を作成する
  Clock::Second.new(13)

  # ネストなしで名前空間付きのクラスを定義する
  # すでにBaseballモジュールが定義されている
  module Baseball
  end

  # モジュール名::クラス名の形でクラスを定義できる
  class Baseball::Second
    def initialize(player,uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end


# トップレベルのセカンドクラス
class Second
  def initialize(player,uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end


module Clock
  # ClockモジュールのSecondクラス
  class Second
    def initialize(digits)
      @digits = digits
      # トップレベルのSecondクラスをnewしたい
      # クラス名の前に::をつけるとトップレベルのクラスを指定したことになる
      @baseball_second = ::Second.new('Clock',10)
    end
  end
end

# initializeメソッドの中でトップレベルのSecondクラスを参照できたのでエラーにならない
puts Clock::Second.new(13)   #<Clock::Second:0x00007ff4b1178bc8>



module Loggable
  # 特異メソッドとしてメソッドを定義する
  def self.log(text)
    puts "[LOG] #{text}"
  end
end

# 他のクラスにミックスインしなくもモジュールクラス単体でそのメソッドを呼び出せる
puts Loggable.log('Hello.')    #[LOG] Hello.

# 特異メソッドを定義
module Loggable
  class << self
    def log(text)
      puts "[LOG] #{text}"
    end

    # 以下、ほかの特異メソッドを定義
  end
end

# module_functionメソッド
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end

  # logメソッドをミックスインとしてもモジュールの特異メソッドとしても使えるようにする
  # (mmodule_functionは対象メソッドの定義よりも下に呼び出すこと)
  module_function :log
end

# モジュールの特異メソッドとしてlogメソッドを呼び出す
puts Loggable.log('Hello.')   #[LOG] Hello.
# Loggableモジュールをincludeしたクラスを定義する
class Product
  include Loggable

  def title
  # includeしたLoggableモジュールのlogメソッドを呼び出す
  log 'title is called.'
  'A great movie'
  end
end
# ミックスインとしてlogメソッドを呼び出す
product = Product.new
puts product.title
# [LOG] title is called.
# "A great movie"

# logメソッドはprivateなので外部からは呼び出せない
#product.log'Hello.'     #NoMethodError
module Loggable
  # ここから下のメソッドはすべてのモジュール関数
  module_function
  def log(text)
    puts "[LOG] #{text}"
  end
end


# モジュールに定数を定義する
module Loggable
  # 定数を定義する
  PREFIX = '[LOG]'.freeze

  def log(text)
    puts "#{PREFIX} #{text}"
  end
end

# 定数を参照する
puts Loggable::PREFIX   #[LOG]


# モジュール関数や定数を持つモジュールの例
# モジュールの特異メソッドとしてsqrt(平方根)メソッドを利用する
puts Math.sqrt(2)  #1.4142135623730951

class Calculator
  include Math

  def calc_sqrt(n)
    # ミックスインとしてMathモジュールのsqrtメソッドを使う
    sqrt(n)
  end
end
calculator = Calculator.new
puts calculator.calc_sqrt(2)   #1.4142135623730951
puts Math::E      #2.718281828459045
puts Math::PI     #3.141592653589793

# Kernelモジュールの特異メソッドとしてputsやpを呼び出す
Kernel.puts "Hello."   #Hello.
Kernel.p [1,2,3]       #[1,2,3]



# 状態を保持するモジュールの作成
# AwesomeApiは何らかのWeb APIを利用するライブラリ、という想定
module AwesomeApi
  # 設定値を保持するクラスインスタンス変数を用意する
  @base_url = ""
  @debug_mode = false

  #  クラスインスタンス変数を読み書きするための特異メソッドを定義する
  class << self
    def base_url = (value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode = (value)
      @debug_mode = value
    end

    def debug_mode
      @debug_mode
    end
  end
end

  # 設定値を保存する
  AwesomeApi.base_url = 'http://example.com'
  AwesomeApi.debug_mode = true

  # 設定値を参照する
  AwesomeApi.base_url
  AwesomeApi.debug_mode

