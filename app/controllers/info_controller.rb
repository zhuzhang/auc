class InfoController < ApplicationController
    before_filter :authenticate_user!
    def show
        @info = current_user.user_info
    end
    def new
        if current_user.user_info.blank?
            @info = UserInfo.new
        else
            redirect_to action: 'show'
        end
    end
    def create
        if current_user.user_info.blank?
            @info = current_user.create_user_info(user_info_params)
        end
        redirect_to action: 'show'
    end
    def edit
        @info = current_user.user_info
    end
    def update
        @info = current_user.user_info
        if @info.update(user_info_params)
            redirect_to action: 'show'
        else
            render 'edit'
        end
    end
    def destroy
        @info = current_user.user_info
        @info.destroy
        redirect_to action: 'show'
    end
    private
    def user_info_params
        params[:user_info].permit(:name, :gender, :birthday, :location, :self_description)
    end
end
