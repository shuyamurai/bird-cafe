class Users::NameController < ApplicationController
  before_action :check_guest, only: :create

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザーの変更はできません。' if params[:user][:email].downcase == 'guest@example.com'
  end
end


# class Users::NamesController < Devise::PasswordsController