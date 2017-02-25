class Price
  attr_reader :cents

  def initialize cents
    raise PriceError, "#{cents} is not an integer value." unless cents.is_a? Integer

    @cents = cents
  end

  def self.from_cents c
    Price.new c.to_i
  end

  def self.from_euros e
    e.sub!(',', '.') if e.is_a? String
    Price.from_cents (e.to_f * 100).round
  end
end

class PriceError < StandardError; end
