module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(first_name: 'Jack',
             last_name: 'Bauer',
             email: 'jbauer@ctu.gov',
             password: 'damn_it!',
             password_confirmation: 'damn_it!')
   visit '/users/new'

   fill_in :first_name,  with: first_name
   fill_in :last_name,   with: last_name
   fill_in :email,       with: email
   fill_in :password,    with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
 end
end
