class TestController < ApplicationController
  def test
    # sign_in Partner.first
    render text: current_partner
  end
end
