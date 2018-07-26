require 'rails_helper'

describe 'search presenter' do
  it 'gets examples' do
    allow_any_instance_of(OxfordService).to receive(:results).and_return(stubbed_oxford_response)
    word = 'mindfulness'
    sp = SearchPresenter.new(word)
    examples = sp.examples

    expect(examples).to be_a(Array)
    expect(examples.first).to be_a(String)

    examples.each do |sentence|
      # Start with uppercase, end with period, include mindfulness
      expect(sentence[0]).to eq(sentence[0].upcase)
      expect(sentence[-1]).to eq('.')
      expect(sentence).to include(word)
    end
  end
end
