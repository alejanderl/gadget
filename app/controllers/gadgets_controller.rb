class GadgetsController < ApplicationController

	before_filter :authenticate_user!, except: [:index]


	def index
		current_user ||= User.new
		#@gadgets = Gadgets.my_gadgets(current_user).page params[:page]

	end
	def show
	end
	def new
	end
	def create
	end
	def edit
	end
	def update
	end
	def destroy
	end



end