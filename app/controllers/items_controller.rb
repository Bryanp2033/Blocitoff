class ItemsController < ApplicationController


  #basic crud actions
  def new
    @item = Item.new
  end

  def create
  	@item = current_user.items.build(item_params)
  	if @item.save
  		flash.now[:notice] = "Item was saved"
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = "There was an error saving the item. Please try again"
  		render :new
  		
  	end
  end



  #deletion with ajax feature, if doesn't get deleted it will display this error
  def destroy
    @item = Item.find(params[:id])

    if not @item.destroy
      flash[:error] = "Item couldn't be deleted.try again!"
    end


    respond_to do |format|
      format.html
      format.js
    end
  end

  

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
