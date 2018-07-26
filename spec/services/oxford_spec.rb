require 'rails_helper'

describe 'oxford service' do
  it 'returns valid examples' do
    word = 'mindfulness'
    oxford = OxfordService.new(word)
    results = oxford.results

    expect(results).to be_a(Array)
    result_id = results.first[:id]
    expect(result_id).to eq(word)
  end
end
