class Api::V1::BaseController < ApplicationController
  respond_to :json

  before_action :set_headers
  before_action :check_permission

  protected
  def check_permission
    #Do nothing override this method in the inherited controllers
  end

  def set_headers
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate, post-check=0, pre-check=0"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end

  def set_pagination
    @per_page = (params[:per_page] || 150).to_i
    @page = (params[:page] || 1).to_i
  end

  def render_api(object, options = nil)
    options ||= {}
    parameters = {}

    if (object)
      parameters.merge!(json: object)
    end

    if (options[:meta])
      parameters.merge!(meta: options[:meta])
    elsif (paginator = options[:pagination])
      # NOTE: pagination option is a Ransack paginator object
      if (@per_page and @per_page > 0)
        parameters.merge!(
          meta: {
            per_page: @per_page,
            current_page: @page,
            total: ((paginator.length - 1) / @per_page) + 1
          }
        )
      end
    end

    render(parameters)
  end

  deprecate :render_api

  def api_error!(message, errors, options = {})
    status = options[:status] || 422

    if (message and errors)
      render(
        json: {
          status: status,
          message: I18n.t(message),
          errors: errors
        },
        status: status
      )
    end
  end

  alias_method :render_api_error, :api_error!


end
