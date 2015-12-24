class Task < ActiveRecord::Base
  has_one :po_line_item 
  has_one :project
end
