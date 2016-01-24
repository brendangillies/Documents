class MasterPosController < ApplicationController
  
  def index
    @pos = MasterPo.all
  end
  
  def new
    @po = MasterPo.new()
  end
  
  def create 
    #Instantiate a new object using form parameters
    @po = MasterPo.new(po_params)
    # Save the object 
    if @po.save
    # If save succeeds, redirect to the index action 
    flash[:notice] = "PO #{@po.po_num} created successfully"
    redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
    flash[:notice] = "Something was missing"
    render('new')
    end
  end
  
  
  
  
  private 
    def po_params
      # same as using "params[:subject]", except that it: 
      # - raises an error if :suject is not present 
      # - allows listed attributes to be mass-assigned
      params.require(:master_po).permit(:po_id, :project_id, :company_id)
    end 
  
  
  
end
