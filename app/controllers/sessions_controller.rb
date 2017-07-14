class SessionsController < Devise::SessionsController
	prepend_before_action :check_captcha, only: [:create]
	protected
	private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_in_params
        @searchingfor = " "
		@searchwalls = []
		@searchparamsarray = []
        flash[:recaptcha_error] = "Please make sure you do the ReCaptcha verification"
        respond_with_navigational(resource) { render :new }
      end 
    end
end