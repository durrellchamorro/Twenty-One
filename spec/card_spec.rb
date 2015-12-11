require 'spec_helper'
require './spec/custom/should_have_attr_accessor'
require './app/card'

describe Card do
  subject(:card) { described_class.new(2, 'Diamonds') }

  it { expect(card).to have_attr_accessor(:suit) }
  it { expect(card).to have_attr_accessor(:value) }
end