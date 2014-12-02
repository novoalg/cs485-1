module ApplicationHelper

    def title(page_title)
        content_for :title, page_title.to_s
    end

    def role_none?
      user_signed_in? && current_user.role_id == 1
    end

    def role_read?
      user_signed_in? && current_user.role_id >= 2
    end

    def role_edit?
      user_signed_in? && current_user.role_id >= 3
    end

    def role_add?
      user_signed_in? && current_user.role_id >= 4
    end

    def role_delete?
      user_signed_in? && current_user.role_id >= 5
    end

    def current_season
      now = Time.now
      month = now.month
      day = now.day

      winter = (month == 12 && day >= 21) || month == 1 || month == 2 || (month == 3 && day < 21)
      spring = (month == 3 && day >= 21) || month == 4 || month == 5 || (month == 6 && day < 21)
      summer = (month == 6 && day >= 21) || month == 7 || month == 8 || (month == 9 && day < 21)
      autumn = (month == 9 && day >= 21) || month == 10 || month == 11 || (month == 12 && day < 21)

      if winter
        "winter"
      elsif spring
        "spring"
      elsif summer
        "summer"
      elsif autumn
        "autumn"
      else 
        "autumn"
      end

    end
  
end
