module Api
    module V1
        class UsersController < ApplicationController

            wrap_parameters :user, include: [:username, :password, :password_confirmation, :email, :date_of_birth, :role_id]


            def index
                json_response(User.all)
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    json_response(@user)
                    return
                end
                json_response(@user.errors, 422)
            end

            def show
                @user = User.find(params[:id])
                json_response(@user)
            end
            

            def update
                @user = User.find(params[:id])
                if !@user.update(user_params)
                    json_response(@user.errors, 422)
                    return
                end
                json_response(@user)
            end
            

            def destroy
                
            end

            private
            def user_params
                params.require(:user).permit(:username, :password, :password_confirmation, :email, :date_of_birth, :role_id)
            end
        end
    end
end