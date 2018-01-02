class UsersController < ApplicationController
  def show
    @user = current_user
    first_name = @user.first_name.present? ? @user.first_name.capitalize : ''
    last_name = @user.last_name.present? ? @user.last_name.capitalize : ''
    @full_name = first_name + ' ' + last_name
  end
end
