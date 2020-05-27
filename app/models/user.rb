class User < ApplicationRecord
    has_one :usertogenre
    before_save { self.mail = mail.downcase }
    has_secure_password
end
