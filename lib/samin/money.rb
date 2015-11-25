require 'pry'
module Samin
  ## Money class that implements required features for currency
  ## conversion
  class Money
    attr_writer :currency_ref_name, :currency_ref_conversion_rates
    attr_reader :currency, :amount

    def initialize(amount = 0, currency = 'CHF')
      @amount   = amount
      @currency = currency
    end

    def inspect
      "#{@amount} #{@currency}"
    end

    def convert_to
      Money.new
    end

    def self.conversion_rates(currency_name = 'EUR', rates = {})
      unless currency_name.nil? || rates.nil?
        @currency_ref_name ||= currency_name
        @currency_ref_conversion_rates ||= rates
        return true
      end
      false
    end
  end
end
