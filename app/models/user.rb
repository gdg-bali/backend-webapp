class User < ApplicationRecord
	include OmniauthRegisterable

	has_many :sessions
	has_many :identities
	
	has_secure_token :public_id
end
