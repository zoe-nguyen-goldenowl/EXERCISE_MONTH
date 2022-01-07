require 'digest'

class Signup
    def initialize ;end
    def signup
        file = File.open("user.txt")
        data = file.read.chomp.split("\n").to_a
        print "what your gmail: "
        mail = gets.chomp
        print "Your password: "
        pass = gets.chomp
        pass = Digest::MD5.hexdigest(pass)
        key = mail+","+pass
        ans = data.select!{|i| i==key}
        if ans.length <1 
            p "login fail!"
        else
            p "login successful!"
        end
    end 

end
