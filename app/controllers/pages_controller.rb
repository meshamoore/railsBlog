class PagesController < ApplicationController
	def home
		@posts = current_user ? current_user.feed : Post.all
		render('home')
	end
end
