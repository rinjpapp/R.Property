crumb :root do
  link "<i class='fa-solid fa-house'></i>".html_safe, root_path
end

crumb :search_homes do
  link "<i class='fa-solid fa-magnifying-glass'></i>物件一覧".html_safe, search_homes_path
end

crumb :home do
  if params[:id].present? && params[:building_id].present?
    @building = Building.find(params[:building_id])
  else
    @building = Building.find(params[:id])
  end
  link "<i class='fa-regular fa-building'></i>#{@building.building_name}".html_safe, home_path(@building)
  parent :search_homes
end

crumb :building_room do
  @room = Room.find(params[:id])
  @building = @room.building
  link "<i class='fa-solid fa-door-closed'></i>#{@room.room_number}".html_safe, building_room_path(@building.id, @room.id)
  parent :home
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).