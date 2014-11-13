module SessionStepsHarness

  def signed_in?
    !@current_user.nil?
  end

  def sign_in(user = Rails.application.secrets.admin_email, password = Rails.application.secrets.admin_pass)
    visit new_user_session_path
    fill_in 'Email', :with => user
    fill_in 'Password', :with => password
    click_button 'Log In'
    @current_user = User.find_by_email(user)
  end

  def current_user
    @current_user
  end

  def sign_out
    @current_user = nil
    visit "users/sign_out"
  end

end

World(SessionStepsHarness)