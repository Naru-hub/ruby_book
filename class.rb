# userを表すデータをハッシュと配列で表す
users = []
users << {first_name:'Alice',last_name: 'Ruby',age: 20}
users << {first_name:'Bob',last_name: 'Python',age: 30}

# userのデータを表示する
users.each do |user|
  puts "氏名: #{user[:first_name]}#{user[:last_name]}、年齢:#{user[:age]}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30


# ユーザーのデータを作成
users = []
users << {first_name:'Alice',last_name: 'Ruby',age: 20}
users << {first_name:'Bob',last_name: 'Python',age: 30}
# 氏名を作成するメソッド
def full_name(user)
  "#{user[:first_name]}#{user[:last_name]}"
end

# userのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}、年齢:#{user[:age]}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30


# Userクラスを定義する
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name,last_name,age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

    # 氏名を作成するメソッド
  def full_name
    "#{first_name}#{last_name}"
  end
end

# ユーザのデータを作成する
users = []
users << User.new('Alice','Ruby',20)
users << User.new('Bob','Python',30)

# userのデータを表示する
users.each do |user|
  puts "氏名: #{user.full_name}、年齢:#{user.age}"
end
# 氏名: AliceRuby、年齢:20
# 氏名: BobPython、年齢:30