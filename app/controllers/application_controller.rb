class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user_from_token!
    partner_email = params[:email].presence
    partner       = partner_email && Partner.find_by_email(partner_email)

    if partner && Devise.secure_compare(partner.authentication_token, params[:partner_token])
      sign_in partner
    end
  end
end
