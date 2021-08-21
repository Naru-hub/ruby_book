class Team
  # 配列をfreezeして要素の追加や削除を禁止する
  COUNTRIES = deep_freeze(['Japan','US','India'])
end

# 配列自身と配列の全要素がfreezeされている
puts Team::COUNTRIES.frozen?

