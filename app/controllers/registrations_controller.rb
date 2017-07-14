class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  def new
    @title = 'Sign Up'
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end
  protected
	def after_sign_up_path_for(resource)
    case resource.class.name
    when "User"
      if current_user.provider?
        "/"
      else
        @user = current_user
        @user.display_name = @user.username
        @user.save
        "/after_sign_up" # Or :prefix_to_your_route
      end 
    when "Partner"
      '/partners/sign_up/step_2'
    end
  		   
  end
  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end 
    end
end
