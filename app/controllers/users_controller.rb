class UsersController < ApplicationController
  def index
    usuarios = Users::ListarTodos.call
    render json: usuarios
  end

  def create
    Rails.logger.debug "PARAMS RAW: #{params.inspect}"
    Rails.logger.debug "USER PARAMS: #{user_params.inspect}"

    usuario = Users::Cadastrar.call(user_params)
    render json: usuario, status: :created
  end

  private

  def user_params
    params.require(:user).permit(
      :nome,
      :user_name,
      :senha
    )
  end
end
