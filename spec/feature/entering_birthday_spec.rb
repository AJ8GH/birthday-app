ONE_DAY = 60 * 60 * 24

def enter_month_click_go
  select now.strftime('%B'), from: :month
  click_button 'Go!'
end

feature 'entering birthday' do
  let(:now) { Time.now }
  before    { Timecop.freeze(now) }

  scenario 'on user birthday' do
    visit_and_enter_name
    fill_in :day, with: now.day
    select now.strftime('%B'), from: :month
    click_button 'Go!'
    expect(page).to have_content 'Happy Birthday Frank!'
  end

  scenario 'user birthday in 1 day' do
    tomorrow = now + ONE_DAY * 1
    visit_and_enter_name
    fill_in :day, with: tomorrow.day
    select tomorrow.strftime('%B'), from: :month
    click_button 'Go!'
    expect(page).to have_content 'Your birthday will be in 1 day Frank!'
  end

  scenario 'user birthday in 45 days' do
    forward_45_days = now + ONE_DAY * 45
    visit_and_enter_name
    fill_in :day, with: forward_45_days.day
    select forward_45_days.strftime('%B'), from: :month
    click_button 'Go!'
    expect(page).to have_content 'Your birthday will be in 45 days Frank!'
  end

  scenario 'user birthday in 226 days' do
    forward_226_days = now + ONE_DAY * 226
    visit_and_enter_name
    fill_in :day, with: forward_226_days.day
    select forward_226_days.strftime('%B'), from: :month
    click_button 'Go!'
    expect(page).to have_content 'Your birthday will be in 226 days Frank!'
  end
end