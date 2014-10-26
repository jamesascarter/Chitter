require 'bcrypt'

class User

attr_reader :password
attr_accessor :password_confirmation


	include DataMapper::Resource

	property :id, Serial
	property :email, String
	property :password_digest, Text
	property :password_confirmation, Text

	def password=(password)
		@password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end