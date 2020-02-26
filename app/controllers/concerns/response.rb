module Response
    def json_response(object, http_status = 200)
        http_status == 200 ? response =  "success" : response = "error"
        render json: {status: response, data: object}, status: http_status
    end
end