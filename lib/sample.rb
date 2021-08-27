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
  # puts "エラー: #{e.class}#{e.message}"
end
#0で除算したか、存在しないメソッドが呼び出されました
# エラー: NoMethodErrorundefined method `foo' for "abc":String


begin
  'abc'.foo
rescue NoMethodError
  # NoMethodErrorはここで補足される
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end
#NoMethodErrorです

begin
  # NameErrorを発生させる
  Foo.new
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end
#NameErrorです

begin
  # ZeroDivisionErrorを発生させる
  1/0
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue StandardError
  puts 'その他のエラーです'
end
#その他のエラーです


begin
  # ZeroDivisionErrorを発生させる
  1/0
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue  #例外クラスを指定しない
  puts 'その他のエラーです'
end
#その他のエラーです

retry_count = 0
begin
  puts '処理を開始します。'
  # わざと処理を発生させる
  1/0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします。(#{retry_count}回目)"
    retry
  else
    puts 'retryに失敗しました。'
  end
end
# 処理を開始します。
# retryします。(1回目)
# 処理を開始します。
# retryします。(2回目)
# 処理を開始します。
# retryします。(3回目)
# 処理を開始します。
# retryに失敗しました。


# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'dollar'
#   when :india
#     'rupee'
#   else
#     # 意図的に例外を発生させる
#     raise "無効な国名です。#{country}"
#   end
# end

# puts currency_of(:japan)   #"yen"
# puts currency_of(:italy)   #無効な国名です。italy (RuntimeError)

# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'dollar'
#   when :india
#     'rupee'
#   else
#     # RuntimeErrorではなく、ArgumentErrorを発生させる
#     raise ArgumentError, "無効な国名です。#{country}"
#   end
# end
# currency_of(:italy)   #無効な国名です。italy (ArgumentError)


# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'dollar'
#   when :india
#     'rupee'
#   else
#     # raiseメソッドに例外クラスのインスタンスを渡す(newの引数はエラーメッセージになる)
#     raise ArgumentError.new("無効な国名です。#{country}")
#   end
# end
# currency_of(:italy)    #無効な国名です。italy (ArgumentError)


# def convert_heisei_to_date(heisei_text)
#   m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
#   year = m[:jp_year].to_i + 1988
#   month = m[:month].to_i
#   day = m[:day].to_i
#   # 例外処理の範囲を挟め、捕捉例外クラスを限定する
#   begin
#     Date.new(year,month,day)
#   rescue ArgumentError
#     # 無効な日付があればnilを返すnil
#     nil
#   end
# end

# convert_heisei_to_date('平成28年12月31日')
# convert_heisei_to_date('平成28年99月99日')


# require 'date'
# def convert_heisei_to_date(heisei_text)
#   m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
#   year = m[:jp_year].to_i + 1988
#   month = m[:month].to_i
#   day = m[:day].to_i
#   # 正しい日付のみDateオブジェクトを作成する
#   if Date.valid_date?(year,month,day)
#     Date.new(year,month,day)
#   end
# end

# convert_heisei_to_date('平成28年12年31日')
# convert_heisei_to_date('平成28年99月99日')


# elseに入ったら例外を発生させるパターン
# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'dollar'
#   when :india
#     'rupee'
#   else
#     raise ArgumentError,"無効な国名です。#{country}"
#   end
# end
# # 例外が発生する
# currency_of(:italy)  #無効な国名です。italy (ArgumentError)

input = gets.chomp
input