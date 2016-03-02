class MasterPosController < ApplicationController
  
  def index
		if params.has_key?(:project_id)
			@project = Project.find(params[:project_id])
		elsif current_project.nil?
			@project = curent_project
		else
			flash[:notice] = "No current project selected"
		end
    @pos = @project.master_pos.all
  end
  
  def show
    @po = MasterPo.find(params[:id])
  end
  
  def new
		@project = Project.find(params[:project_id])
    @po = @project.master_pos.new()
  end
  
  def create 
		@project = Project.find(params[:project_id])
    #Instantiate a new object using form parameters
    @po = @project.master_pos.new(po_params)
    # Save the object 
    if @po.save
    # If save succeeds, redirect to the index action 
    flash[:notice] = "PO created successfully"
    redirect_to(:action => 'index', :project_id => @project.id)
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
      params.require(:master_po).permit(:project_id, :company_id, :po_num, :is_active)
    end 
end
