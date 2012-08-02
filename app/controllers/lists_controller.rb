class ListsController < ApplicationController

	def index
		@lists = List.all
	end

	# 0.0.0.0:3000/lists/  parameters
	def show
		@list = List.find(params[:id])	
	end

	# 0.0.0.0:3000/lists/new
	def new
		@list = List.new	
	end

	def create
		# When this action is called, routes gives us
		# the parameters needed to create a new list
		#
		# save the list here	

		# make object piece by piece
		# @list = List.new
		# @list.name = params["list"]["name"]
		#
		#
		# OR  all at the same time
		# 
		# @list = List.new(params[:list])
		# 
		# To see what params have been passed use "puts params"
		
		@list = List.new(params[:list])
		@list.save
	
		redirect_to list_path(@list)	
	end	

	def destroy 
		# Get the thing you want to destroy first
		@list = List.find(params[:id])
		@list.destroy	

		# notice the path is plural
		redirect_to lists_path
	end

end
