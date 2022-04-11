class WelcomeController < ApplicationController
	def index
		@notices = Notice.order('fecha desc').first(7)
	end
end
