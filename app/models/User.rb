require 'bcrypt'

class User

  include DataMapper::Resource


  property :id, Serial
  property :email, String, :unique => true, :message => "This email is already registered"
  property :password_digest, Text
  property :username, Text, :unique => true
  property :name, Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)

    user = first(:email => email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end