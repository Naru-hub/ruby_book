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