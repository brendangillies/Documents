class ProjectController < ApplicationController

  def index 
    @pos = MasterPo.order("created_date ASC")
  end
  
  def tasks 
  end
  
  def dashboard
    #change below to tasks = Lineitem.count
    @tasks = ApprovalDoc.count
  end
  
  def schedule 
  end

end
