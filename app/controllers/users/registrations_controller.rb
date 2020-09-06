class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :update

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更はできません。'
    end
  end

end