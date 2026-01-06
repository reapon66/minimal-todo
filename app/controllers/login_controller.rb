class LoginController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :login ]

  def login
    usuario = Users::Login.call(user_params)
    if usuario
      token = JwtService.encode(user_id: usuario.id)
      render json: {
        token: token,
        user: UserSerializer.new(usuario).as_json
        }, status: :ok
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
