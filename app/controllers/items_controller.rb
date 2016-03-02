class ItemsController < ApplicationController
  def show 
    @item = Item.find(params[:id])
  end
  
  def index
    @po = MasterPo.find(params[:master_po_id])
		@project = Project.find(@po.project_id)
    @items = @po.items
  end
  
  def new
    @item = Item.new()
  end

  def create 
		#temp code
   if(params.has_key?(:master_po_id))
   @po = MasterPo.find(params[:master_po_id])
   else @po = MasterPo.find(1)
   end
   #TODO add code which will prompt the user to create a PO is one does not exist
   @item = @po.items.build(item_params)

   respond_to do |format|
    if @item.save 
      format.html { redirect_to @item, notice: 'Line Item was successfully created.' }
      format.json { render :show, status: :created, location: @item }
    @po = MasterPo.new(po_params)
    #@item = Item.new(po_params) I don't know why we need to create a child just because we're creating the parent. 
    #you should be able to create a blank PO and add items later
    else
      # IF save fails, redisply the form so user can fix problems.
	format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end
	end

  def update
		if(params.has_key?(:id))
			 @item = Item.find(params[:id])
		end
    if @item.update_attributes(item_params)
			if params[:field].present? # means that the action is used via `best_in_place`
    		render json: { params[:field].to_sym => @item.send(params[:field]) }
 			else
   			 respond_with items
		  end
    else
      # IF save fails, redisply the form so user can fix problems.
      render json: @item.errors, status: :unprocessable_entity 
    end
  end

  private 
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params 
     params.require(:item).permit(:master_po_id, :line_item_num, :line_item_desc, :docs_required, :price, :status_code,
																 :approved_by_date)
    end
end	
