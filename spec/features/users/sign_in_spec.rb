require 'spec_helper'
require 'subscribem/testing_support/subdomain_helpers'
require 'subscribem/testing_support/factories/account_factory'
require 'subscribem/testing_support/factories/user_factory'

feature 'User sign in' do
	extend Subscribem::TestingSupport::SubdomainHelpers
	let!(:account) { FactoryGirl.create(:account_with_schema) }
	let(:sign_in_url) { "http://#{account.subdomain}.example.com/sign_in" }
	let(:root_url) { "http://#{account.subdomain}.example.com/" }
	within_account_subdomain do
		scenario "signs in as an account owner successfully" do
			visit root_url
			#this redirection occurs with before_filter in the
			#application controller extender --> 
			#monkey patching (extension of the classes features)
			page.current_url.should == sign_in_url
			fill_in "Email", :with => account.owner.email
			fill_in "Password", :with => "password"
			click_button "Sign in"
			page.should have_content("You are now signed in.")
			page.current_url.should == root_url
		end
	end
end