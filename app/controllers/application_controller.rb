class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user
    before_action :void_record, only: [:destroy]

    include Response
    include ExceptionHandler

      private

      def authenticate_request
          @current_user = AuthorizeApiRequest.call(request.headers).result
          json_response("Not Authorized", 401) unless @current_user
      end

      def void_record
        raise NotImplementedError
      end
end
