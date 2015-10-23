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

    def destroy
      @items = Item.find(params[:id])

      if @items.destroy
        flash[:notice] = "Item was removed"
      else
        flash[:error] = "Item couldn't be deleted.try again!"
      end

       respond_to do |format|
       format.html
       format.js
     end
  end
 end
end
