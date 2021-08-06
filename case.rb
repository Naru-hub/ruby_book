# case文
country = 'us'

case country
when 'japan'
  puts 'こんにちは'
when 'us'
  puts 'Hello'
when 'italy'
  puts 'ciao'
else
  puts '???'
end

# case 複数の値の指定
country = 'イタリア'

case country
when 'japan', '日本' 
  puts 'こんにちは'
when 'us', 'アメリカ'
  puts 'Hello'
when 'italy', 'イタリア'
  puts 'ciao'
else
  puts '???'
end

# case文の結果を変数に入れる
country = 'japan'

message =
  case country
  when 'japan'
    puts 'こんにちは'
  when 'us'
    puts 'Hello'
  when 'italy'
    puts 'ciao'
  else
    puts '???'
  end
  