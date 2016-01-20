class ItemsController < ApplicationController
  def show 
    @polineitem = Item.find(1)
  end
  
  def index
    @pos = MasterPo.order("created_date ASC")
    @items = Item.order("line_item_id")
  end
  
  
  def new
    @item = Item.new()
  end

  def create 
    @po = MasterPo.new(po_params)
    #@item = Item.new(po_params) I don't know why we need to create a child just because we're creating the parent. 
    #you should be able to create a blank PO and add items later
    if @po.save 
      #&& @item.save 
      redirect_to(:action => 'index')
    else
      # IF save fails, redisply the form so user can fix problems.
      render('new')
    end
  end
  
  private 
    def po_params 
      params.require(:item).permit(:is_active, :company_id, :created_date, :project_id)
    end

end
