class EmailTemplatesController < ApplicationController

    def index
        @templates = EmailTemplate.all
    end

    def edit
        @template = EmailTemplate.find(params[:id])

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
