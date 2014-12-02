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
  
end
