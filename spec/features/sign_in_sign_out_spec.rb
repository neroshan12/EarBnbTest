feature 'User sign in' do

  let!(:user) do
    User.create(first_name: 'Jack',
                last_name: 'Bauer',
                email: 'jbauer@ctu.gov',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.first_name} #{user.last_name}"
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(first_name: 'Jack',
                last_name: 'Bauer',
                email: 'jbauer@ctu.gov',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'while being signed in' do
    sign_in(email: 'jbauer@ctu.gov', password: 'damn_it!')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, Jack Bauer')
  end
end
