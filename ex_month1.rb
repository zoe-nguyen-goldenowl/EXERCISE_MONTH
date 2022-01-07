require 'digest'
module Authentication
    def md_5(mail, pass)
        arr =[]
            # mail = Digest::MD5.hexdigest(mail)
            pass = Digest::MD5.hexdigest(pass)
           arr << mail<<pass
           arr
    end

    def check?(mail , pass)
        pattern = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,5}/ 
        if pass.match?(/[A-Z]/) && pass.length > 6 && mail.match?(pattern)
            true
        else 
            false
        end   
    end  
end

class User
    include Authentication
    def initialize(mail, pass)
        @mail = mail
        @pass = pass
    end

    def save_file
        if check?(@mail , @pass)
            info = md_5(@mail, @pass)
            mail,pass = info
            tk = mail +","+ pass
            file = File.new("user.txt", "a+")
            file.puts(tk)
            file.close
        end
    end
end

