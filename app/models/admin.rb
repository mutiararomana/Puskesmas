class Admin < ActiveRecord::Base
  
    before_save { self.email = email.downcase }
    validates :username,
            presence: true,
            uniqueness: true,
            length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password, 
            presence: true, 
            length: { minimum: 6 }
    # Returns the hash digest of the given string.
    def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
end
