class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render ({ :template => "user_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_username"=>"anisa"}
  url_username = params.fetch("path_username")

  mathcing_usernames = User.where({ :username => url_username })

  @the_user = mathcing_usernames.first

    render ({ :template => "user_templates/show.html.erb"})
  end

  def new_user
    # Parameters: {"username"=>"mkarimi"}
    the_username = params.fetch("username")

    a_new_user = User.new

    a_new_user.username = the_username

    a_new_user.save
    
    # render({ :template => "user_templates/add_user.html.erb"})
    next_url = "/users/" + the_username
    redirect_to(next_url)

  end

  def update_user
    # Parameters: {"query_update"=>"Rokh12", "update"=>":update"}

    the_id = params.fetch("update")

    mathcing_usernames = User.where({ :id => the_id })

    the_user = mathcing_usernames.first

    input_user = params.fetch("query_update")

    the_user.username = input_user

    the_user.save
    
    # render({ :template => "user_templates/update_user.html.erb"})
    redirect_to("/users/#{the_user.username}")
  end

end
