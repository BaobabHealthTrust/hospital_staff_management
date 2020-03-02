module Api
    module V1
        class UsersController < ApplicationController
            before_action :find_role, only: [:update, :create]
            wrap_parameters :user, include: [:username, :password, :password_confirmation, :email, :date_of_birth, :role_id]


            def index
                json_response(User.joins("inner join roles 
                                        on roles.id = users.role_id")
                                    .select("users.*, roles.role_name"))
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
                @user = User.joins("inner join roles 
                                        on roles.id = users.role_id")
                                    .select("users.*, roles.role_name")
                                    .where("users.id = #{params[:id]}")
                json_response(@user)
            end
            
            def search
                @utils = UtilsController.new
                query_param = @utils.construct_like_search_query(params[:user])
                json_response(User.search(query_param))
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
                @user.destroy
            end

            private

            def find_role
                @role = Role.find(params[:role_id])
            end

            def user_params
                params.require(:user).permit(:username, :password, :password_confirmation, :email, :date_of_birth, :role_id)
            end
        end
    end
end
