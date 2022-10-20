class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        # render json: params
        user = User.new(user_params)
        # user = User.new(params)
        # user.save!
        # render json: user

        # debugger
        if user.save
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        destroyed_user = User.find(params[:id])
        # User.delete(params[:id])
        # User.find(params[:id]).destroy
        destroyed_user.destroy
        render json: destroyed_user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end
