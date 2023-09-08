require 'rails_helper'

RSpec.feature 'HomeIndex', type: :feature do
  scenario 'user sees the banner image' do
    visit root_path

    expect(page).to have_css("img[src^='/assets/banner']")
  end
end
