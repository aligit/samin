require 'spec_helper'

describe Samin do
  subject { Samin.new }
  let(:conf_base_name) { 'EUR' }
  let(:conf_conversion_rates) {{
    'USD'     => 1.11,
    'Bitcoin' => 0.0047
  }}
  let(:fifty_eur) { Money.new(50, 'EUR')  }

  it 'has a version number' do
    expect(Samin::VERSION).not_to be nil
  end

  context 'Instantiation' do
    describe '#initialize' do
      it 'is a pending example'
    end
  end

  context 'Configuration' do
    describe '.conversion_rates' do
      context 'when conversion rates are properly set' do
        it 'given currency name and conversion rates, returns true' do
          expect(Money.conversion_rates).to be_truthy
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
