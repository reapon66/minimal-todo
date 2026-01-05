class LoginController < ApplicationController
  def login
    usuario = Users::Login.call(user_params)
    if usuario
      render json: UserSerializer.new(usuario).as_json, status: :ok
    else
      render json: { errors: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name,
      :password,
    )
  end
end
