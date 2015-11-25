class Samin::Money
  attr_writer :currency_ref_name
  attr_writer :currency_ref_conversion_rates

  def initialize(args)
  end

  def self.conversion_rates(currency_name='EUR',rates={})
    @@currency_ref_name             = currency_name
    @@currency_ref_conversion_rates = rates
  end
end
