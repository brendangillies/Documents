class ProjectsController < ApplicationController
  
  def index 
    @projects = current_user.projects
  end
  
  def dashboard
    #change below to tasks = Lineitem.count
    @projects = current_user.projects
		if params.has_key?(:id)
			current_user.set_current_project(params[:id])
		end
		@project = current_project(current_user)
		if @project.nil?
			flash[:notice] = "No project set! Please select a current project"
			render action: "index"
		end
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
    @project = Project.find(params[:id])
  end

  private 
      def project_params
        # same as using "params[:subject]", except that it: 
        # - raises an error if :suject is not present 
        # - allows listed attributes to be mass-assigned
        params.require(:project).permit(:project_name, :project_id)
      end


end
