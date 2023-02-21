class MembershipController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end


    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_invalid_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: "Membership not found"}, status: :not_found
    end
end
