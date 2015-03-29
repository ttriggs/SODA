require 'rails_helper'

feature 'creating and updating questions' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question) }

    before :each do
      sign_in_as user
    end

    scenario 'I can successfully create a question' do
      visit new_question_path

      fill_in 'Title', with: question.title
      fill_in 'Description', with: question.description
      click_on 'Create Question'

      expect(page).to have_content('Question saved successfully!')
      expect(page).to have_content(question.title)
    end
  end

  context 'as a visitor' do
    scenario 'I cannot save a question' do
      visit new_question_path

      expect(page).to have_content("Log in")
    end
  end
end
