class ItemsController < ApplicationController
  def show 
    @item = Item.find(1)
  end
  
  def index
    @pos = MasterPo.order("created_date ASC")
    @items = Item.order("line_item_id")
  end
  
  def new
    @item = Item.new()
  end

  def create 
   if(params.has_key?(:master_po_id))
   @po = MasterPo.find(params[:master_po_id])
   else @po = MasterPo.find(1)
   end
   #TODO add code which will prompt the user to create a PO is one does not exist
   @item = @po.items.create(item_params)

   respond_to do |format|
    if @item.save 
      format.html { redirect_to @item, notice: 'Line Item was successfully created.' }
      format.json { render :show, status: :created, location: @item }
    else
      # IF save fails, redisply the form so user can fix problems.
	format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end
  end

  def update
   respond_to do |format|
    if @item.update(item_params) 
      format.html { redirect_to @item, notice: 'Line Item was successfully updated.' }
      format.json { render :show, status: :ok, location: @item }
    else
      # IF save fails, redisply the form so user can fix problems.
	format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
    end
   end
  end

  private 
    def set_item
      @item = Item.find(params[:id])
    end

    def po_params 
     params.require(:item).permit(:company_id, :project_id, :master_po_id)
    end

end
