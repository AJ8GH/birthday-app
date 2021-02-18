feature 'entering name' do
  scenario 'greets user by name on next page' do
    visit_and_enter_name
    click_button 'Go!'
    expect(page).to have_content 'Frank'
  end
end
