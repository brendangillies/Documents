module ApplicationHelper

	def show_sidebar?
		!current_user.nil? & !current_page?(controller: 'application') & !current_page?(controller: 'landing') & !current_page?(controller: 'sessions') & !current_project(current_user).nil?
	end
   
end
