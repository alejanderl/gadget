class GadgetsController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]
	before_filter :is_owner? , only: [:update, :edit, :destroy]


	def index
		
		if current_user
			@gadgets = current_user.gadgets.page params[:page]
		else
			@gadgets = Gadget.all.page params[:page]
		end


	end
	def show
		@gadget = Gadget.find params[:id]
	end
	def new
		@gadget = Gadget.new 
	end
	def create

		@gadget = Gadget.new standard_attributes
		@gadget.user = current_user

		if @gadget.save

			redirect_to @gadget

		else
			render :new
		end

	end
	def edit

		@gadget.images.build
	end

	def update
		
		if @gadget.update_attributes standard_attributes

			redirect_to @gadget

		else
			render "update"

		end



	end

	def destroy
		
		if @gadget.destroy
			redirect_to gadgets_path

		else

			redirect_to @gadget

		end
		


	end

	private 

	def standard_attributes

		
		params.require(:gadget).permit(:name,:description, 
									 :images => [:file, :_destroy])

	end

	def is_owner? 

		@gadget = Gadget.find params[:id]
		
		redirect_to @gadget, notice: "you are not the owner" if @gadget.user_id != current_user.id
	end



end