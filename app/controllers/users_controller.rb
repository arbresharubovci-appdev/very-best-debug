class UsersController < ApplicationController

 
  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users_templates/all_users.html.erb"})
  end
  
  def show
   user_name = params.fetch("username")

    matching_users = User.where({ :username => user_name })
    @user = matching_users.at(0)

    render({ :template => "users_templates/users_details.html.erb"})
  end
  
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    
    the_user.save
    redirect_to("/users/#{the_user.username}")
   
  end

end
