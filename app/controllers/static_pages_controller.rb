class StaticPagesController < ApplicationController
  #Sample code for using custom layout for specific controller
    #layout 'home', :only => :home  --> Not using default layout
  def home
  end

  def help
  end

  def about
  end

  def contact
  end
end
