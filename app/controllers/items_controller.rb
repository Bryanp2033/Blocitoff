class ItemsController < ApplicationController

  def create
  	@items = Item.new(params[:id])
  	if @items.save
  		flash[:notice] = "Item was saved"
  		redirect_to 'welcome#index'
  	else
  		flash[:error] = "There was an error saving the item. Please try again"
  		render :new
  		
  	end
  end
end
