require 'rails_helper'

describe 'oxford service' do
  it 'returns valid examples' do
    oxford = OxfordService.new('mindfulness')
    sentences = oxford.examples

    sentences.each do |sentence|
      # Begin with uppercase letter, end in period, contain word
      expect(sentence[0]).to eq(sentence[0].upcase)
      expect(sentence[-1]).to eq('.')
      expect(sentence).to include('mindfulness')
    end
  end
end
