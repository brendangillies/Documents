class ItemsController < ApplicationController
  def show 
    @polineitem = PoLineItem.find(1)
  end
  
  def index
    @polineitems = PoLineItem.order("item_id")
  end
  
  
  def new
    @item = MasterPo.new()
  end

  def create 
    @item = MasterPo.new(po_params)
    @docs = PoLineItem.new(po_params)
    if @item.save && @docs.save
      redirect_to(:action => 'index')
    else
      # IF save fails, redisply the form so user can fix problems.
      render('new')
    end
  end
  
  private 
    def po_params 
      params.require(:po_num).permit(:is_active, :company_id, :created_date, :project_id)
    end

end
