class SignupsController < ApplicationController
    def create 
        signup = Signup.new(signup_params)
        if signup.save
            activity = signup.activity
            render json: activity ,status: :created
        else  
           render json: {errors:["validation errors"]},status: :unprocessable_entity
        end
    end
    private 
    def signup_params
        params.permit(
            :time,
            :camper_id,
            :activity_id
        )
    end
end
