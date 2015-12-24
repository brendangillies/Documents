class ProjectController < ApplicationController

  def index 
  end
  
  def tasks 
  end
  
  def home 
    @tasks = ApprovalDoc.count
  end

end
