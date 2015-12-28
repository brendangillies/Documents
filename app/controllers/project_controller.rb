class ProjectController < ApplicationController

  def index 
    @pos = MasterPo.order("created_date ASC")
  end
  
  def tasks 
  end
  
  def home 
    @tasks = ApprovalDoc.count
  end

end
