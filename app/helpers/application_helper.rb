module ApplicationHelper

  # Returns the base title on a per-page basis.
  def my_app_title
    "Power Tracking Services"
  end

  # Returns the app name
  def my_app_name
    "TrackMyPower"
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = my_app_title
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
