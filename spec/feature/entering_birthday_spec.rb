feature 'entering birthday' do
  scenario 'on user birthday' do
    visit_and_enter_name
    fill_in :day, with: Time.now.day
    enter_month_click_go
    expect(page).to have_content 'Happy Birthday'
  end

  scenario 'not on user birthday' do
    visit_and_enter_name
    fill_in :day, with: (Time.now - (60 * 60 * 48)).day
    enter_month_click_go
    expect(page).to have_content 'Your birthday will be in'
  end
end