# 与えられた数値が10より大きいかどうかで処理を変える場合
n = 5
if n > 10
  puts '10より大きい'
else
  puts '10以下'
end

# 国によって挨拶を変えたい場合
country = 'japan'
if country == 'japan'
  puts 'こんにちは'
elsif country == 'us'
  puts 'Hello!'
elsif country == 'italy'
  puts 'ciao'
else
  puts '???'
end
