class UsersController < ApplicationController
  def index
  end

  def search
    @user = find_user(params[:username])
  end

  def find_user(username)
    url = "https://api.github.com/users/#{URI.encode_www_form_component(username)}"
    response = Excon.get(url)
    return nil if response.status != 200
    JSON.parse(response.body)
  end

end
