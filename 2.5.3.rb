n = 11
if n > 10
  puts '10より大きい'
else
  puts '10以下'
end
#10より大きい

point = 7
day = 1
if day == 1
  point *= 5
end
puts point  #35

def greeting(country)
  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end
puts greeting('japan')  #こんにちは
puts greeting('us')     #hello

def greeting(country)
  return 'countryを入力してください'if country.nil?

  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end
puts greeting(nil)        #countryを入力してください
puts greeting('japan')    #こんにちは


def some_method
  <<-TEXT
  これはヒアドキュメントです。
  <<-を使うと最後の識別子をインデントさせることができます。
  TEXT
end
puts some_method
#これはヒアドキュメントです。
# <<-を使うと最後の識別子をインデントさせることができます。

name = 'Alice'
a = <<TEXT
ようこそ、#{name}さん!
以下のメッセージを御覧ください
TEXT
puts a
#ようこそ、Aliceさん!
#以下のメッセージを御覧ください

a = 'Ruby'
a.prepend(<<TEXT)    #prependは渡された文字列を先頭に追加するメソッド
Java
PHP
TEXT
puts a
#Java
#PHP
#Ruby

b = <<TEXT.upcase
Hello,
Good-bye
TEXT
puts b
#HELLO,
#GOOD-BYE

puts sprintf('%0.3f',1.2)   #1.200

puts [10,20,30].join   #102030
puts 'Hi!'*10          #Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!Hi!

puts "\u3042\u3044\u3046"       #あいう

a = 'ruby'
puts a.upcase  #RUBY
puts a         #ruby
puts a.upcase! #RUBY
puts a         #RUBY

def reverse_upcase!(s)
  s.reverse!.upcase!
end
s = 'ruby'
puts reverse_upcase!(s)   #YBUR
puts s                    #YBUR

a = 'hello'
b = 'hello'
c = b
def m!(d)
  d.upcase!
end
m!(c)
puts b    #HELLO
puts c    #HELLO