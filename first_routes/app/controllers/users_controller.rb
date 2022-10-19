class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        # render json: params
        user = User.new(student_params)
        # user = User.new(params)
        # user.save!
        # render json: user

        # debugger
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(student_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        User.delete(params[:id])
        render json: User.all
    end

    private
    def student_params
        params.require(:user).permit(:name, :email)
    end

end
