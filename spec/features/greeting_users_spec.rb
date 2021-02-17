feature 'homepage greets users' do
  scenario 'it has generic greeting on homepage' do
    visit '/'
    expect(page).to have_content 'Hello there!'
  end
end
