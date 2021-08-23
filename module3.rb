# AwesomeApiモジュールは設定を保持する(用途その１)
module AwesomeApi
  @base_url = ""
  @debug_mode = false

  class << self
    attr_accessor :base_url,:debug_mode
  end
end

# こちらではAwesomwApiモジュールが名前空間として使われる(用途２)
module AwesomeApi
  class Engine
    # クラスの定義
  end
end


module A
  def to_s
    "<A> #{super}"
  end
end

module B
  def to_s
    "<B> #{super}"
  end
end

class Product
  def to_s
    "<Product> #{super}"
  end
end

class DVD < Product
  include A
  include B

  def to_s
    "<DVD> #{super}"
  end
end
dvd = DVD.new
puts dvd.to_s      #"<DVD> <B> <A> <Product>"
puts DVD.ancestors #[DVD,B,A,Product,Object,Kernel,BasicObject]