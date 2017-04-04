require "Hbrick"
class StaticPagesController < ApplicationController
  #Sample code for using custom layout for specific controller
  #Not using default layout (application.html.erb --> home.html.erb)
  layout 'home', only: [:home]
  before_filter :set_cache_buster, :only => :home
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def home
    #BRICK START
    #Brick: string variables needed in corresponding view (ex. 'home.html.erb' view)
    #saved as a hash
    home_brick = Hbrick.new

    #id: mainNav
    #To add navbar elements just push annother element to the top_navbar_locals array
    top_navbar_locals = []
    top_navbar_locals.push({ text: 'About', path: '#About', type: 'text' })
    top_navbar_locals.push({ text: 'Contact', path: '#Contact', type: 'text' })
    top_navbar_locals.push({ text: 'Log in', path: login_path, type: 'button',
                             glyphicon: 'log-in' })
    #saving to html_bricks
    home_brick.add_packet(:top_navbar_locals, top_navbar_locals)

    #id: mainHeader
    header_locals = {}
    header_locals[:title] = "A new way of keeping track of your HRE system"
    header_locals[:button_text] = "Find out More"
    #saving to html_bricks
    home_brick.add_packet(:header_locals, header_locals)

    #Rendering brick to home layout
    render 'home', locals: {home_brick: home_brick.export}
    #BRICK END
  end

  def help
  end

  def about
  end

  def contact
  end


end
