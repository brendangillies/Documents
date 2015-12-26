class TasksController < ApplicationController

  def show 
  end
  
  def index
    @tasks = Task.order("position ASC")
  end
  
  

end
