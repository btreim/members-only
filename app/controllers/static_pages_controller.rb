class StaticPagesController < ApplicationController
	def home
		@title = 'About Us'
		@content = 'This is the content'
	end
end
