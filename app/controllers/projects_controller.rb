class ProjectsController < ApplicationController

  
  def index 
    @projects = Project.all
  end
  
  def dashboard
    #change below to tasks = Lineitem.count
    @project = Project.find(params[:id])
  end
  
  def _sidenavigation
    #change below to tasks = Lineitem.count
    @project = Project.find(params[:id])
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new()
  end
  
  def create
    #Instantiate a new object using form parameters
    @project = Project.new(project_params)
    # Save the object 
      if @project.save
        # If save succeeds, redirect to the index action 
        flash[:notice] = "'#{@project.project_name}' created successfully"
        redirect_to(:action => 'index')
      else
        # If save fails, redisplay the form so user can fix problems
        flash[:error] = "Something was missing"
        render('new')
      end
  end
  
  
  def delete 
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project = Project.find(params[:id]).destroy
    flash[:notice] = "'#{@project.project_name}'was deleted successfully"
    redirect_to(:action => 'index')
  end
  
  
 
  def schedule 
  end

  private 
      def project_params
        # same as using "params[:subject]", except that it: 
        # - raises an error if :suject is not present 
        # - allows listed attributes to be mass-assigned
        params.require(:project).permit(:project_name, :project_id)
      end


end
