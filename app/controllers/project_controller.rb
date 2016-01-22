class ProjectController < ApplicationController

  def index 
    @pos = MasterPo.order("created_date ASC")
  end
  
  def tasks 
  end
  
  def dashboard
    @tasks = ApprovalDoc.count
  end

end
