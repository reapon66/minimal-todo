class UsersController < ApplicationController
  def create
    usuario = Users::Cadastrar.call(user_params)

    render json: UserSerializer.new(usuario).as_json,
           status: :created
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :user_name,
      :password,
      :password_confirmation
    )
  end
end
