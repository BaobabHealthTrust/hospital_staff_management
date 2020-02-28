module ExceptionHandler
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError do |e|
        json_response(e.message, 500)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response(e.message, 404) #not found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response(e.message, 422) #unprocessable entity\
      end

      rescue_from NotImplementedError do |e|
        json_response("", 501)
      end
    end
  end