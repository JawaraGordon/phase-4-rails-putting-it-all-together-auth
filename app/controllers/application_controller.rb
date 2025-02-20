class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorized_user

  def current_user
    User.find_by(id: session[:user_id])
end
  
def authorized_user
    return render json: {errors: ["Not Authorized"]}, status: :unauthorized unless current_user
end

private



  

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
