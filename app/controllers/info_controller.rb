class InfoController < ApplicationController
    before_filter :authenticate_user!
    def show
        @info = current_user.user_info
    end
    def new
        @info = UserInfo.new
    end
    def create
        if current_user.user_info.blank?
            @info = current_user.create_user_info(params[:user_info].permit(:name, :gender, :birthday, :location, :self_description))
        end
        redirect_to action: 'show'
    end
    def edit
        @info = current_user.user_info
    end
    def update
        @info = current_user.user_info
        if @info.update(params[:user_info].permit(:name, :gender, :birthday, :location, :self_description))
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
end
