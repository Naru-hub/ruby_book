# 応用 既存のメソッドをエイリアスメソッドとして残し、上書きしたメソッドの中で既存のメソッドを再利用する事もできる
# 以下のUserクラスは外部ライブラリーで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello,#{@name}!"
  end
end  

# モンキーパッチをあてるためにUserクラスを再オープンする
class User
    # 既存のhelloメソッドはhello_originalとして呼び出せるようにしておく
  alias hello_original hello

  # helloメソッドにモンキーパッチをあてる
  # (元々実装されていたhelloメソッドも再利用する)
  def hello
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end

# モンキーパッチをあてたhelloメソッドの挙動を確認する
user =  User.new('Alice')
puts user.hello     #Hello,Alice!じゃなくて、Aliceさん、こんにちは！
