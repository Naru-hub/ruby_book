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

