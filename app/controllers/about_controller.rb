class AboutController < ApplicationController
	def index
		@title = 'About us';
		@content = 'This is the About page.';
	end
end
