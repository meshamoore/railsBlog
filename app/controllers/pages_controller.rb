class PagesController < ApplicationController
	def home
		@posts = Post.all
		render('home')
	end
end
