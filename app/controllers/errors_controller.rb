class ErrorsController < ApplicationController
  layout 'errors'
  def error404
    render status: :not_found
  end
  def error403
    render status: :forbidden
  end
  def error500
    render status: :internal_server_error
  end
end
