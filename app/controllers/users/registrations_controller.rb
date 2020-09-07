class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :update

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザーの変更はできません。' if resource.email == 'guest@example.com'
  end
end
