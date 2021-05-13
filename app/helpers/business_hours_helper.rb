module BusinessHoursHelper
    def display_business_hour(bh)
      if bh[:opened]
        "shops/partial/show/business-hour-partials/open"
      else
        "shops/partial/show/business-hour-partials/close"
      end
    end
    def display_days_name(day)
      if  Time.now.wday == day
        "shops/partial/show/business-hour-partials/first_day"
      else
        "shops/partial/show/business-hour-partials/other_days"
      end
    end
  end
  