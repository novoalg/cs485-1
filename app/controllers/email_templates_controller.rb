class EmailTemplatesController < ApplicationController
    before_filter :can_send_email

    def index
        @templates = EmailTemplate.all
    end

    def edit
        @template = EmailTemplate.find(params[:id])
    end

    def new_mass_email
        @users = User.where(:role_id => 0)
        @template = EmailTemplate.find(2)
    end

    def mass_email
        @users = params[:mass_email]
        @users.each do |form_id, user_id|
            AdminMailer.send_user_email(User.find(user_id)).deliver
        end
        flash[:success] = "Sent #{@users.count} users email"
        redirect_to email_templates_path
    end

    def update
        @template = EmailTemplate.find(params[:id])
        if @template.update_attributes(email_template_params)
            flash[:success] = "Template updated successfully."
            redirect_to email_templates_path
        else
            flash[:error] = @template.errors.full_messages
            render 'edit'
        end
    end

    private

    def email_template_params
        params.require(:email_template).permit!
    end

end
