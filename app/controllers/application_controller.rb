class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    include Response
    include ExceptionHandler

      private

      def authenticate_request
          @current_user = AuthorizeApiRequest.call(request.headers).result
          json_response("Not Authorized", 401) unless @current_user
      end
end
