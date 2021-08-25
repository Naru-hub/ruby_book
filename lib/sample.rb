puts 'Start'
module Greeter
  def hello
    'hello'
  end
end
# 例外処理を組み込んで例外に対処する
begin
greeter = Greeter.new
rescue
  puts '例外が発生したが、このまま続行する'
end

#例外処理を組み込んだので最後まで実行可能
puts 'End'
# Start
# 例外が発生したが、このまま続行する
# End


# method_1にだけ例外処理を記述する
def method_1
  puts 'method_1 start.'
  begin
    method_2
  rescue
  puts '例外が発生しました'
  end
  puts 'method_1 end.'
end

def method_2
  puts 'method_2 start.'
  method_3
  puts 'method_3 start.'
  #ZeroDivisionErrorを発生させる
  1/0
  puts 'method_3 end.'
end
# end処理を開始する
method_1
# method_1 start.
# method_2 start.
# 例外が発生しました
# method_1 end.


def method_1
  puts 'method_1 start.'
def method_2
  puts 'method_1 end.'
end
end
# 処理を開始する
method_1


# 例外オブジェクトから情報を取得する
begin
  1/0
rescue => e
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース ------"
  puts e.backtrace
  puts "-----"
end


# 例外のクラスを指定すると例外オブジェクトのクラスが一致した場合のみ例外を補足する
begin
  1/0
rescue ZeroDivisionError
  puts "0で除算しました"
end
#0で除算しました


# begin
  # NoMethodErrorを発生させる
  # 'abc'.foo
# rescue ZeroDivisionError
#   puts "0で除算しました"
# end
#NoMethodError

begin
  'abc'.foo
rescue ZeroDivisionError
  puts "0で除算しました"
rescue NoMethodError
  puts "存在しないメソッドが呼び出されました"
end
#存在しないメソッドが呼び出されました


begin
  'abc'.foo
rescue ZeroDivisionError,NoMethodError
  puts "0で除算したか、存在しないメソッドが呼び出されました"
end
#0で除算したか、存在しないメソッドが呼び出されました

begin
  'abc'.foo
rescue ZeroDivisionError,NoMethodError => e
  puts "0で除算したか、存在しないメソッドが呼び出されました"
  puts "エラー: #{e.class}#{e.message}"
end
#0で除算したか、存在しないメソッドが呼び出されました
# エラー: NoMethodErrorundefined method `foo' for "abc":String

