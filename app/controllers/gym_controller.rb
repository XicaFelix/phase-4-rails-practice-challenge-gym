class GymController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        render json: @gym
    end

    def destroy
        @gym.destroy
        head :no_content
    end


    private

    def set_gym
        @gym = Gym.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end
end
