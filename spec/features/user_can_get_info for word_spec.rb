require 'rails_helper'

describe 'user submits word' do
  it 'shows examples of that word' do

    visit "/"
    fill_in 'word', with: "mindfulness"
    click_on "Submit"

    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(page).to have_css('.example')
    within(first('.example')) do
      expect(page).to have_content('mindfulness')
    end
    # And I should see a list of sentences with examples of how to use the word
    # And I should see only sentences for usage in North America
    # And I should not see sentences for any other regions
  end
end
