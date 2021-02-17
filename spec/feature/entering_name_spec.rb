feature 'entering name' do
  scenario 'greets user by name on next page' do
    visit '/'
    fill_in :name, with: 'Frank'
    click_button 'Go!'
    expect(page).to have_content 'Frank'
  end
end
