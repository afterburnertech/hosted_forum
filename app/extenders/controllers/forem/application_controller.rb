Forem::ApplicationController.class_eval do
	# This method is called before every action inside every 
	# controller that inherits from this class
	before_filter :authenticate_user!	
end