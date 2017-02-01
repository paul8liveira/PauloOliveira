class Language < ApplicationRecord
	has_many :portfolios, dependent: :destroy	
end
