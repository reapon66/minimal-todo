class ApplicationController < ActionController::API
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotUnique, with: :render_conflict
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing


  def render_unprocessable_entity(exception)
    errors = exception.record.errors.map do |error|
    { campo: error.attribute.to_s, msg: error.message }
    end
    render json: { errors: errors }, status: :unprocessable_entity
  end

  def render_conflict(exception)
    render json: { errors: [ { campo: "base", msg: "Já existe um registro com este valor" } ] }, status: :conflict
  end

  def render_not_found(_exception)
    render json: { errors: [ { campo: "id", msg: "Registro não encontrado" } ] }, status: :not_found
  end

  def render_parameter_missing(exception)
    render json: { errors: [ { campo: exception.param.to_s, msg: "Parâmetro obrigatório ausente" } ] }, status: :bad_request
  end

  private

  def current_user
    return @current_user if @current_user

    token = request.headers["Authorization"]&.split(" ")&.last
    return nil unless token

    decoded = JwtService.decode(token)
    @current_user = User.find_by(id: decoded["user_id"])
  rescue
    nil
  end

  def authenticate_user!
    render json: { error: "Não autorizado" }, status: :unauthorized unless current_user
  end
end
