begin
  puts 'Hello.'
rescue
  puts '例外が発生しました'
else
  puts '例外は発生しませんでした'
end
#Hello.
#例外は発生しませんでした

# else節を使わない場合
begin
  puts 'Hello.'
  puts '例外は発生しませんでした'
rescue
  puts '例外が発生しました'
end
#Hello
#例外は発生しませんでした


# 例外処理と戻り値
# 正常に終了した場合
ret =
begin
  'OK'
rescue
  'error'
ensure
  'ensure'
end
puts ret  #OK

# 例外が発生した場合
ret =
begin
  1 / 0
  'OK'
rescue
  'error'
ensure
  'ensure'
end
puts ret   #error


def some_method(n)
  begin
    1 / n
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
end
puts some_method(1)  #OK
puts some_method(0)  #error
