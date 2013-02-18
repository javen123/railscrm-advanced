require 'spec_helper'

describe "Admin", vcr: true do
  
  before do
    @admin     = FactoryGirl.create :admin_user
    login_as @admin

  end

  it 'shows admin page' do
    visit organizations_path
    page.should have_content 'Organizations'
    page.should_not have_content 'Dashboard'
  end

  it 'creates organization' do
    visit organizations_path
    click_link 'Create New Organization'
    fill_in 'Name',     with: 'New Org'
    fill_in 'Phone',    with: '8005551212'
    fill_in 'Address',  with: '123 Sesame'
    fill_in 'City',     with: 'New York'
    fill_in 'State',    with: 'NY'
    fill_in 'Zip',      with: '12345'
    click_button 'Create Organization'
    page.should have_content 'Organization successfully created'
    page.should have_content 'New Org'
  end

  before do
    @organization = FactoryGirl.create :organization
  end

  it 'edits organization' do
    visit organizations_path
    click_link 'edit'
    fill_in 'Name', with: 'New Name'
    click_button 'Update'
    page.should have_content 'Organization successfully updated'
  end

  it 'deletes organization', js: true do
    visit organizations_path
    click_link 'delete'
    page.driver.browser.switch_to.alert.accept
    page.should have_content 'Organization Deleted'
    page.should_not have_content 'New Name'
  end

  it 'shows organization' do
    visit organizations_path
    click_link 'New Org'
    page.should have_content 'View Organization'
  end

  it 'adds user to organization', js: true do
    visit organization_path(@organization)
    click_link 'Add Member'
    fill_in 'First name',            with: 'Super'
    fill_in 'Last name',             with: 'User'
    fill_in 'Email',                 with: 'org_test@example.com'
    fill_in 'Password',              with: 'password'
    fill_in 'Password confirmation', with: 'password'
    select2 'User',                  from: 'Organization role'
    click_button 'Create User'
    page.should have_content 'Successfully added new user'
  end

  before do
    @user = FactoryGirl.create :user
    @organization = FactoryGirl.create :organization
    @organization.users << @user
    visit organization_path(@organization)
  end

  it 'lists users' do
    page.should have_content 'Test User'
  end

  it 'edits user', js: true do
    click_link 'edit'
    select2 'Admin', from: 'Organization role'
    click_button 'Update User'
    page.should have_content 'Successfully updated user'
  end

  it 'deletes user', js: true do
    click_link 'delete'
    page.driver.browser.switch_to.alert.accept
    page.should have_content 'Successfully deleted user'
    page.should_not have_content 'Test User'
  end


end