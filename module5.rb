module Sample
  class User
    NAME = 'Alice'.freeze
    def self.hello(name = NAME)
      "Hello,I am #{name}."
    end
  end
end

puts Sample::User::NAME   #Alice
puts Sample::User.hello   #Hello,I am Alice.
puts Sample::User::hello   #Hello,I am Alice.

s = 'abc'
puts s::upcase     #ABC

