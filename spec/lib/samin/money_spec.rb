require 'spec_helper'

module Samin
  describe Money do
    let(:conf_base_name) { 'EUR' }
    let(:conf_conversion_rates) { { 'USD' => 1.11, 'Bitcoin' => 0.0047 } }
    let(:new_amount) { 20 }
    let(:new_currency) { 'CHF' }
    let(:money_amount) { 50 }
    let(:money_currency) { 'EUR' }
    let(:fifty_eur) { Money.new(money_amount, money_currency) }

    context 'Instantiation' do
      describe '#initialize' do
        it 'to not raise an error when no params are provided' do
          expect {
            Money.new
          }.to_not raise_error
          expect {
            Money.new(new_amount,nil)
          }.to_not raise_error
        end
        it 'to not raise error when all required params are present' do
          expect {
            Money.new(new_amount,new_currency)
          }.to_not raise_error
        end
      end
    end

    context 'Configuration' do
      describe '.conversion_rates' do
        context 'when conversion rates are properly set' do
          it 'given currency name and conversion rates, returns true' do
            expect(Money
              .conversion_rates(conf_base_name,
                                conf_conversion_rates)).to be_truthy
          end
        end
        context 'when conversion rates are not provided' do
          it 'sets default conversion rates when they are not provide
          and returns true' do
            expect(Money.instance_variable_get(:@currency_ref_name))
              .to eq conf_base_name
            expect(Money.instance_variable_get(:@currency_ref_conversion_rates))
              .to eq conf_conversion_rates
          end
        end
        context 'when wrong parameter values are provided' do
          it 'falsy if wrong conversion rates are provided' do
            expect(Money.conversion_rates(nil, nil)).to be_falsy
          end
        end
      end
    end

    describe '#currency' do
      it 'returns currency of money' do
        expect(fifty_eur.currency).to eq money_currency
      end
    end

    describe '#amount' do
      it 'returns amount of money' do
        expect(fifty_eur.amount).to eq money_amount
      end
    end

    describe '#convert_to' do
      it 'is a pending example'
    end

    context 'Arithmetics' do
      describe '#+' do
        it 'is a pending example'
      end

      describe '#-' do
        it 'is a pending example'
      end

      describe '#/' do
        it 'is a pending example'
      end

      describe '#*' do
        it 'is a pending example'
      end
    end

    context 'Comparisons' do
      describe '#==' do
        it 'is a pending example'
      end

      describe '#<' do
        it 'is a pending example'
      end

      describe '#>' do
        it 'is a pending example'
      end
    end
  end
end
