feature 'property' do
  scenario 'add a new property' do
    visit('/properties/new')
    fill_in :address1, with: '1 New Street'
    fill_in :price, with: 10
  #  select(4, :from => 'bedrooms')
    fill_in :description, with: "Awesome house to rent."
    click_button 'Add'
    expect(page).to have_content('1 New Street')
  end
end
