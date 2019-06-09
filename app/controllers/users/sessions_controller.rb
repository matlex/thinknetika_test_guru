# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action(only: :create) { welcome_message(current_user.first_name) } # use devise's 'current_user' helper

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def welcome_message(user_name)
    flash[:notice] = "Привет, #{user_name}!"
  end

end
