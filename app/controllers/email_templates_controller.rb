class EmailTemplatesController < ApplicationController
    before_filter :can_send_email

    def index
        @welcome = EmailTemplate.find(1)
    end

    def edit
        @template = EmailTemplate.find(params[:id])
    end

    def new_mass_email
        @mass_email = EmailTemplate.new
    end

    def mass_email
        @subject = params[:email_template][:subject]
        @content = params[:email_template][:content]
        @users = User.where(receive_emails: true)
        unless @subject.empty? || @content.empty? 
            @users.each do | user | 
                AdminMailer.send_user_email(user, @subject, @content).deliver
            end

            flash[:success] = "Sent email to #{@users.size} users."
            redirect_to email_templates_path
        else
            flash.now[:alert] = "Please ensure that you have entered a subject and a body."
            @mass_email = EmailTemplate.new
            @mass_email.subject = @subject
            @mass_email.content = @content

            render 'new_mass_email'
        end
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
