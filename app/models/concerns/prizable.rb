module Prizable
  extend ActiveSupport::Concern

  included do
    composed_of :price, mapping: [ %w(price_cents cents) ]
  end
end
