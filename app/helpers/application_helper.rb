module ApplicationHelper

    def title(page_title)
        content_for :title, page_title.to_s
    end

    def role_none?
      current_user.role_id == 0
    end

    def role_read?
      current_user.role_id >= 1
    end

    def role_edit?
      current_user.role_id >= 2
    end

    def role_add?
      current_user.role_id >= 3
    end

    def role_delete?
      current_user.role_id >= 4
    end
  
end
