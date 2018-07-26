require 'rails_helper'

describe 'user submits word' do
  it 'shows examples of that word' do
    allow_any_instance_of(OxfordService).to receive(:results).and_return(stubbed_oxford_response)

    visit "/"
    fill_in 'word', with: "mindfulness"
    click_on "Submit"

    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(page).to have_css('.example')
    within(first('.example')) do
      expect(page).to have_content('mindfulness')
    end
    # North American Example
    expect(page).to have_content("So mindfulness of drinking is already one kind of enlightenment.")
    # Non-North American Example
    expect(page).to_not have_content("If you think mindfulness involves labeling what comes up and doing everything in a very deliberate fashion, you will suffer enormously because")
  end
end
