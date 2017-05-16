module MeasurementsHelper

  def units(variable)
    units = {}
    units_list = [
      ["voltage", "V"],
      ["current", "A"],
      ["power", "W"],
      ["energy", "kWh"],
      ["temperature", "°C"],
      ["humidity", "%"],
      ["solar", "W/m²"],
      ["speed", "km/h"],
      ["direction", "deg"]
    ]
    units_list.each do |var, unit|
      units[var] = unit
    end
    output = ""
    units.keys.each do |k|
      output = units[k] if variable.downcase.include?(k)
    end
    output
  end

  def create_notifications(measurement_class)
    alert_type = measurement_class.table_name
    Alert.where(enabled: true, type: alert_type).each do |alert|
      reference = measurement_class.last[alert.variable]
      notification_hash = {}
      notification_hash["source"] = User.find_by(username: "System")
      notification_hash["user"] = alert.user
      send_email = false
      case alert.comparator
      when "greater_or_equal_than"
        notification_hash["type"] = "warning"
        notification_hash["title"] = "Alert: Threshold value exceeded"
        notification_hash["text"] = "#{alert.variable.humanize.titleize} value (#{reference} #{units(alert.variable)}) has exceeded the preset threshold value (#{alert.value1} #{units(alert.variable)})."
        if reference >= alert.value1
          notification = Notification.create(notification_hash)
          if !alert.user.notifications.where(email: true).last.nil?
            send_email = true if (Time.now-alert.user.notifications.where(email: true).last["created_at"])/ 1.hours >=1
          end
          if alert.email?
            if send_email || alert.user.notifications.count == 1
              last_notifications = alert.user.notifications.where(seen: false).order(created_at: :desc).first(5)
              UserMailer.new_notification(alert.user, notification, last_notifications).deliver_later
              notification["email"] = true
              notification.save
            end
          end
        end
      when "less_or_equal_than"
        notification_hash["type"] = "warning"
        notification_hash["title"] = "Alert: Measurement value below threshold"
        notification_hash["text"] = "#{alert.variable.humanize.titleize} value (#{reference} #{units(alert.variable)}) is under the preset threshold value: #{alert.value1} #{units(alert.variable)}."
        if reference <= alert.value1
          notification = Notification.create(notification_hash)
          if !alert.user.notifications.where(email: true).last.nil?
            send_email = true if (Time.now-alert.user.notifications.where(email: true).last["created_at"])/ 1.hours >=1
          end
          if alert.email?
            if send_email || alert.user.notifications.count == 1
              last_notifications = alert.user.notifications.where(seen: false).order(created_at: :desc).first(5)
              UserMailer.new_notification(alert.user, notification, last_notifications).deliver_later
              notification["email"] = true
              notification.save
            end
          end
        end
      when "belongs_to_range"
        notification_hash["type"] = "warning"
        notification_hash["title"] = "Alert: Measurement value belongs to range"
        notification_hash["text"] = "#{alert.variable.humanize.titleize} value (#{reference} #{units(alert.variable)}) is in the specified range: [#{alert.value1} ~ #{alert.value2} #{units(alert.variable)}]."
        if reference >= alert.value1 and reference <= alert.value2
          notification = Notification.create(notification_hash)
          if !alert.user.notifications.where(email: true).last.nil?
            send_email = true if (Time.now-alert.user.notifications.where(email: true).last["created_at"])/ 1.hours >=1
          end
          if alert.email?
            if send_email || alert.user.notifications.count == 1
              last_notifications = alert.user.notifications.where(seen: false).order(created_at: :desc).first(5)
              UserMailer.new_notification(alert.user, notification, last_notifications).deliver_later
              notification["email"] = true
              notification.save
            end
          end
        end
      else
        nil
      end
    end
  end

end
