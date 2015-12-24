class TasksController < ApplicationController

  def index
    @tasks = ApprovalDoc.order("priority_code")
  end
  
  

end
