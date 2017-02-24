module TokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_save :ensure_authentication_token
  end

  private

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Partner.where(authentication_token: token).first
    end
  end
end
