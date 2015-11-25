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
    let(:currency_to_convert) { 'USD' }
    let(:converted_money) { fifty_eur.convert_to(currency_to_convert) }
    let(:twenty_dollars ) { Money.new(20, 'USD') }
    let(:arith_sum_result) { fifty_eur+twenty_dollars }
    let(:arith_sub_result) {  fifty_eur-twenty_dollars }
    let(:arith_div_result) { fifty_eur/2 }
    let(:arith_mul_result) { twenty_dollars*3 }
    let(:twenty_dollars2) { Money.new(20, 'USD') }
    let(:twenty_dollars3) { Money.new(30, 'USD') }

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
            expect(Money.class_variable_get(:@@currency_ref_name))
              .to eq conf_base_name
            expect(Money.class_variable_get(:@@currency_ref_conversion_rates))
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

    describe '#inspect' do
      it 'returns both #amount and #currency' do
        expect(fifty_eur.inspect).to be_instance_of String
        expect(fifty_eur.inspect).to eq "#{money_amount} #{money_currency}"
      end
    end

    describe '#convert_to' do
      it 'should return an instance of Money' do
        Money.conversion_rates(
          conf_base_name,
          conf_conversion_rates)
        expect(fifty_eur.convert_to(currency_to_convert))
          .to be_instance_of Money
      end
      it 'should return the expected value' do
        Money.conversion_rates(
          conf_base_name,
          conf_conversion_rates)
        expect(converted_money.amount).to eq Money.new(55.50,'USD').amount
      end
    end

    context 'Arithmetics' do
      describe '#+' do
        it 'should return as result the sum of prvoided moneys' do
          Money.conversion_rates(
            conf_base_name,
            conf_conversion_rates)
          expect(arith_sum_result.amount).to eq Money.new(68.02 ,'EUR').amount
        end
      end

      describe '#-' do
        it 'should return as result the substraction of prvoided moneys' do
          Money.conversion_rates(
            conf_base_name,
            conf_conversion_rates)
          expect(arith_sub_result.amount).to eq Money.new(31.98 ,'EUR').amount
        end
      end

      describe '#/' do
        it 'given dividend returns the result of divison of amount' do
          Money.conversion_rates(
            conf_base_name,
            conf_conversion_rates)
          expect(arith_div_result.amount).to eq Money.new(25 ,'EUR').amount
        end
      end

      describe '#*' do
        it 'given multiplicand returns the result of multiplication of amount' do
          Money.conversion_rates(
            conf_base_name,
            conf_conversion_rates)
          expect(arith_mul_result.amount).to eq Money.new(60 ,'USD').amount
        end
      end
    end

    context 'Comparisons' do
      describe '#==' do
        it 'returns true if equal' do
          expect(twenty_dollars == twenty_dollars2).to be_truthy
        end
        it 'returns false if not equal' do
          expect(twenty_dollars == twenty_dollars3).to be_falsy
        end
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
