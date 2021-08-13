text = <<TEXT
I love Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

puts text.scan(/[A-Z][A-Za-z]+/)    #["Ruby","Python","JAVA","JavaScript"]


text = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056 兵庫県西脇市板波町1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4})/,'\1-\2')
# 私の郵便番号は123-4567です。
# 僕の住所は677-0056 兵庫県西脇市板波町1234だよ。


text = <<-TEXT
名前:伊藤淳一
電話:03-1234-5678
住所:兵庫県西脇市板波町1-2-3
TEXT
puts text.scan /\d\d-\d\d\d\d-\d\d\d\d/   #["03-1234-5678"]


text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
？？：9999-99-9999
？？：03(1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
puts numbers = text.scan(/0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/)  # ["03(1234)5678", "03(1234-5678","03(1234-5678"]
puts numbers.grep(/\(\d+\)|-\d+-/)   #["03(1234)5678"]    grepメソッドを使って"03(1234-5678"を除外している


text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT
puts text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)


html = <<-HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML
replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/,'\1,\2')
puts replaced


text = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
     
hello('Bob')
	
hello('Carol')
TEXT
puts text.gsub(/^[\t]+$/, '')   #無駄なスペースやタブ文字が削除されている


text = <<-TEXT
John:guitar, George:guitar, Paul:bass, Ringo:drum
Freddie:vocal, Brian:guitar, John:bass, Roger:drum
TEXT
puts text.scan(/\w+(?=:bass)/)   #["Paul","John"]


# if文で=~を使うとマッチしたかどうか判別できる
if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end
#マッチしました

# 左辺に正規表現をおいても結果は同じ
puts /\d{3}-\d{4}/ =~ '123-4567'     #0
puts /\d{3}-\d{4}/ =~ 'hello'        #nil

# !~を使うとマッチしなかったときにtrueを、マッチしたときにfalseを返します
# マッチしなければtrue
puts 'hello' !~ /\d{3}-\d{4}/     #true
# マッチすればfalse
puts '123-4567' !~ /\d{3}-\d{4}/  #false


# matchメソッドを使う
text = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
puts m[1]    #"1977"
puts m[2]    #"7"
puts m[3]    #"17"
# 文字列が正規表現にマッチするとMatchDataオブジェクトが返り、マッチしない場合はnilが返ります。
/(\d+)年(\d+)月(\d+)日/.match(text)   #<MatchData "1977年7月17日"1:"1977"2:"7"3:"17">
/(\d+)年(\d+)月(\d+)日/.match('foo')  #nil


# 条件分岐の中で真偽値の判定とローカル変数への代入を同時にする、よく使われるコード
text = '私の誕生日は1977年7月17日です。'
# 真偽値の判定とローカル変数への代入を同時にやってしまう
if m = /(\d+)年(\d+)月(\d+)日/.match(text)
  # マッチした場合の処理(ローカル変数のmを使う)
else
  #  マッチしなかった場合の処理
end
# MatchDataは[]を使って正規表現の処理結果を配列と同じような方法で取得できます。
text = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
# マッチした部分全体を取得する
puts m[0]     #"1977年7月17日"
# キャプチャの2番目から2個取得する
puts m[2,2]   #["7",""17]
# 最後のキャプチャを取得する
puts m[-1]     #"17"
# Rangeを使って取得する
puts m[1..3]   #["1977","7","17"]
# matchメソッドはStringクラスとRegexoクラスの両方に定義されているため文字列と正規表現オブジェクトを入れ替えても同じように動作する 
text = '私の誕生日は1977年7月17日です。'
puts m = text.match(/(\d+)年(\d+)月(\d+)日/)    #<MatchData "1977年7月17日"1:"1977"2:"7"3:"17">