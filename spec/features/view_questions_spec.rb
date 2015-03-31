require 'rails_helper'

feature 'view quesitons' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'I can see all questions' do
      question = FactoryGirl.create(:question)

      visit questions_path
      expect(page).to have_content(question.title)
    end

    scenario 'I can view a questions details' do
      question = FactoryGirl.create(:question, title: '1111111111 2222222222')

      visit questions_path
      expect(page).to have_link(question.title)
      click_on '1111111111 2222222222'

      expect(page).to have_content(question.title)
      expect(page).to have_content(question.description)

    end
  end
end

