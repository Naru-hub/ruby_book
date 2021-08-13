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