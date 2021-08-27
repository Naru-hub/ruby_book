# print 'Text?:'
text = gets.chomp

begin
  print 'Pattern?:'
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join(',')}"
else
  puts "Nothing matched."
end


# 書き込みモードでファイルを開く
file = File.open('some.txt', 'w')

begin
  # ファイルに文字列を書き込む
  file << 'Hello'
ensure
  # 例外の有無かかわらず必ずファイルをクローズする
  file.close
end

# ブロック付きでオープンするとメソッドの実行後に自動的にクローズされる
File.open('some.txt','w') do |file|
  file << 'Hello'
  # わざと例外を発生させる
  1 / 0
end
# 例外は発生するもののopenメソッドによってクローズ処理自体は必ず行われる
#divided by 0 (ZeroDivisionError)
