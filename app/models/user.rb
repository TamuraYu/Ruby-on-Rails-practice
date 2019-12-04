class User < ApplicationRecord
  include EmailAddressChecker

  validates :user_name, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true,
              message: :invalid_user_name },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validate :check_email
  validates :password, presence: { on: :create },
    confirmation: { allow_blank: true }
  
  attr_accessor :password, :password_confirmation
  
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end
  
  private
  def check_email
    if mail.present?
      errors.add(:mail, :invalid) unless well_formed_as_email_address(mail)
    end
  end
  
  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("user_name LIKE ?", "%#{query}%")
      end
      rel
    end
    
    def authenticate(name, password)
      user = find_by(user_name: name)
      if user && user.hashed_password.present? &&
        BCrypt::Password.new(user.hashed_password) == password
        user
      else
        nil
      end
    end

  end
end
