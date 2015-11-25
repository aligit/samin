require 'spec_helper'

describe Samin::Money do
  let(:conf_base_name) { 'EUR' }
  let(:conf_conversion_rates) {{
    'USD'     => 1.11,
    'Bitcoin' => 0.0047
  }}
  let(:fifty_eur) { Samin::Money.new(50, 'EUR')  }

  context 'Instantiation' do
    describe '#initialize' do
      it 'is a pending example'
    end
  end

  context 'Configuration' do
    describe '.conversion_rates' do
      context 'when conversion rates are properly set' do
        it 'given currency name and conversion rates, returns true' do
          expect(Samin::Money.conversion_rates).to be_truthy
        end
      end
      context 'when issues are raised while setting conversion rates' do
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
