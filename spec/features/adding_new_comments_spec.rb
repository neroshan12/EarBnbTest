feature 'Creating comments' do

  let!(:user) do
    User.create(first_name: 'Jack',
                last_name: 'Bauer',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
    Property.create(
                address1: '1 Aldgate East Road'
                address2: 'Aldgate'
                address3: 'East London'
                city: 'Central London'
                state: 'Greater London'
                post_code: 'E12 4DH'
                price_per_night: '10'
                bedrooms: '2'
                image_url: 'https://search.savills.com/content/assets/properties/gbcwrdcnd160531/CND160531_06_gal.JPG'
                created_at: #'(10:32 on 03/10)'
    )
  end

# /properties/pram/new_comment/

  scenario 'I can add new comments' do
    sign_in(email: user.email,   password: user.password)

    visit '/properties/111/new_comment'
    fill_in 'comment', with: 'Hello World!'
    click_button 'comment'

    expect(current_path).to eq('/properties/111')

    within 'ul#properties' do
      expect(page).to have_content('Hello World!')
    end
  end

  scenario 'I cannot create an empty comment' do
    sign_in(email: user.email,   password: user.password)
    visit '/properties/111/new_comment'

    expect { click_button 'comment' }.to_not change(Comment, :count)
    expect(current_path).to eq('/properties/111/new_comment')
    expect(page).to have_content('Comment must not be empty')
  end

  scenario 'I cannot create a comment longer than 200 characters' do
    sign_in(email: user.email,   password: user.password)
    visit '/properties/111/new_comment'
    fill_in 'comment', with: "I will get through Makers Academy and be a Junior Developer!,
                              I will get through Makers Academy and be a Junior Developer!,
                              I will get through Makers Academy and be a Junior Developer!,
                              I will get through Makers Academy and be a Junior Developer!,
                              I will get through Makers Academy and be a Junior Developer!"

    expect { click_button 'comment' }.to_not change(Comment, :count)
    expect(current_path).to eq('/properties/111/new_comment')
    expect(page).to have_content('Comment must not be more than 200 characters')
  end
end
