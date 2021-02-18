def visit_and_enter_name
  visit '/'
  fill_in :name, with: 'Frank'
end

def enter_month_click_go
  select Time.now.strftime('%B'), from: :month
  click_button 'Go!'
end