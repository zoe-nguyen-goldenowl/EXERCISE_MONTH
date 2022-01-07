#!/usr/bin/env ruby
require './ex_month1.rb'
class Login < User
    def initialize ;end
    def question
        print "Would you like login now? 'yes/no':  "
        ans = gets.chomp
        if ans.upcase == 'YES'
            print "what your gmail: "
            mail = gets.chomp
            print "Your password: "
            pass = gets.chomp
            User.new("#{mail.to_s}", "#{pass.to_s}").save_file
        else
            print "Login fail\n"
        end
    end
end
Login.new.question