require 'spec_helper'

module Samin
  describe Money do
    let(:conf_base_name) { 'EUR' }
    let(:conf_conversion_rates) { { 'USD' => 1.11, 'Bitcoin' => 0.0047 } }
    let(:fifty_eur) { Money.new(50, 'EUR') }

    context 'Instantiation' do
      describe '#initialize' do
        it 'is a pending example'
      end
    end

    context 'Configuration' do
      describe '.conversion_rates' do
        context 'when conversion rates are properly set' do
          it 'given currency name and conversion rates, returns true' do
            expect(Money.conversion_rates(conf_base_name,
                                          conf_conversion_rates)).to be_truthy
          end
        end
        context 'when conversion rates are not provided' do
          it 'sets default conversion rates when they are not provide' do
            expect(Money.instance_variable_get(:@currency_ref_name))
              .to eq conf_base_name
            expect(Money.instance_variable_get(:@currency_ref_conversion_rates))
              .to eq conf_conversion_rates
          end
        end
      end
    end

    describe '#currency' do
      it 'is a pending example'
    end

    describe '#amount' do
      it 'is a pending example'
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
