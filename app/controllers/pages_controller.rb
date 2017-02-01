class PagesController < ApplicationController
	def home
		@contact = Contact.new
		@portfolios = Portfolio.all
		@about = About.select(:about).order(created_at: :desc).limit(1)
	end
end
