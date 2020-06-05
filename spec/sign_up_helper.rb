# frozen_string_literal: true

def sign_up(user)
  visit '/'
  click_link 'Sign up'
  provide_details(user)
  click_button 'Sign up'
end

def provide_details(user)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password_confirmation
end