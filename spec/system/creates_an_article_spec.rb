require 'rails_helper'

describe 'creates an article', type: :system do

  let!(:user) { create(:user) }

  it 'creates an article' do
    sign_in user

    expect {
      visit new_article_url

      fill_in 'article_title', with: 'title'
      fill_in 'article_body', with: 'body'
      click_on 'Create Article'
    }.to change { Article.count }.by 1
  end
end
