module ApplicationHelper

    def title(page_title)
        content_for :title, page_title.to_s
    end

    def role_zero
        unless (current_user && current_user.role_id >= 0)
            flash[:notice] = "You don't have permission to the page you tried to access."
            redirect_to root_path
        end
    end

    def role_one
        unless (current_user && current_user.role_id >= 1)
            flash[:notice] = "You don't have permission to the page you tried to access."
            redirect_to root_path
        end
    end

    def role_two
        unless (current_user && current_user.role_id >= 2)
            flash[:notice] = "You don't have permission to the page you tried to access."
            redirect_to root_path
        end
    end

    def role_three
        unless (current_user && current_user.role_id >= 3) || (current_user.id.to_i == params[:id].to_i)
            flash[:notice] = "You don't have permission to the page you tried to access."
            redirect_to root_path
        end
    end

    def role_four
        unless (current_user && current_user.role_id == 4)
            flash[:notice] = "You don't have permission to the page you tried to access."
            redirect_to root_path
        end
    end
  
end
