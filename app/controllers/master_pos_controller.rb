class MasterPosController < ApplicationController
  
  def index
    @pos = MasterPo.all
  end
  
  def show
    @po = MasterPo.find(params[:id])
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
    flash[:notice] = "PO created successfully"
    redirect_to(:action => 'index', :id => @project.id)
    else
    # If save fails, redisplay the form so user can fix problems
    flash[:notice] = "Something was missing"
    render('new')
    end
  end
  
  def delete 
    @po = MasterPo.find(params[:id])
  end
  
  def destroy
    @po = MasterPo.find(params[:id]).destroy
    flash[:notice] = "PO deleted successfully"
    redirect_to(:action => 'index', :id => @po.id)
  end
  
  
  
  
  
  private 
    def po_params
      # same as using "params[:subject]", except that it: 
      # - raises an error if :suject is not present 
      # - allows listed attributes to be mass-assigned
      params.require(:master_po).permit(:po_id, :project_id, :company_id, @project.id)
    end 
  
  
  
end
