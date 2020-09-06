class Users::NamesController < Devise::PasswordsController
  before_action :check_guest, only: :create

  def check_guest
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更はできません。'
    end
  end
end