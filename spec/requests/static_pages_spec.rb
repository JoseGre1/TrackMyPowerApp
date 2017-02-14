require 'rails_helper'

RSpec.describe "Static Page" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home Page" do
    it "should have the content 'Sample App'"  do
      visit '/static_pages/home'
      page.should have_selector('h1',
        :text => "Sample App")
    end
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_title("| Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1',
        :text => "Help")
    end
    it "'Help' should have the right title" do
      visit '/static_pages/help'
      page.should have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1',
        :text => "About Us")
    end
    it "'About Us' should have the right title" do
      visit '/static_pages/about'
      page.should have_title("#{base_title} | About Us")
    end
  end
end
