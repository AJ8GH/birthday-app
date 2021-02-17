feature 'homepage greets users and asks name and birthday' do
  before { visit '/' }

  scenario 'it has generic greeting on homepage' do
    expect(page).to have_content 'Hello there!'
  end

  scenario 'it asks user name' do
    expect(page).to have_content "What's your name?"
  end

  scenario 'it asks user birthday' do
    expect(page).to have_content "When's your birthday?"
  end
end
