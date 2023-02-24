# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    #carbs 50% of total cals
      # 4 cals per gram

    #fats 30% of total cals
      # 9 cals per gram

    #protein 20% of total cals
      # 4 cals per gram
    
    # @diary.calories_budget = totalCal
    # @diary.protein_budget = ((totalCal * 0.2) / 4).to_i   #
    # @diary.fats_budget = ((totalCal * 0.3) / 9)           # to calculate recommended macro targets
    # @diary.carbs_budget = ((totalCal * 0.5) / 4) 
    super
  end

  # POST /resource
  def create
    
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :cals_budget, :protein_budget, :fats_budget, :carbs_budget])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :cals_budget, :protein_budget, :fats_budget, :carbs_budget])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
