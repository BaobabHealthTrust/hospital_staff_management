class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
      command = AuthenticateUser.call(params[:username], params[:password])
   
      if command.success?
        json_response({auth: command.result})
      else
        json_response(command.errors, 401)
      end
    end
end
