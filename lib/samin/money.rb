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

    def convert_to(currency)
      rate = @@currency_ref_conversion_rates[currency]
      return nil if rate.nil?
      Money.new((@amount*rate).to_f.round(2),currency)
    end

    def +(other)
      sum = -1
      if other.currency.eql? @currency
        sum = @amount+other.amount
      else
        other_converted = other.convert_from(other.currency)
        sum = other_converted.amount + @amount
      end
      Money.new(sum,@@currency_ref_name)
    end

    def -(other)
      sub = -1
      if other.currency.eql? @currency
        sub = @amount-other.amount
      else
        other_converted = other.convert_from(other.currency)
        sub = @amount - other_converted.amount
      end
      Money.new(sub,@@currency_ref_name)
    end

    def self.conversion_rates(currency_name = 'EUR', rates = {})
      unless currency_name.nil? || rates.nil?
        @@currency_ref_name ||= currency_name
        @@currency_ref_conversion_rates ||= rates
        return true
      end
      false
    end

    def convert_from(currency)
      rate = @@currency_ref_conversion_rates[currency]
      Money.new((@amount/rate).to_f.round(2),currency)
    end
  end
end
