require 'rails_helper'

feature 'create an answer' do
  context 'as an authorized user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:answer) { FactoryGirl.create(:answer) }

    before :each do
      sign_in_as user
    end

    scenario 'create on the question show page' do
      question = FactoryGirl.create(:question)
      visit question_path(question)

      fill_in 'Title', with: answer.title
      fill_in 'Body', with: answer.body
      click_on 'Create new Answer'

      expect(page).to have_content('Answer saved successfully.')
    end
  end
end
