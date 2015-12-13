class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :select_plan, only: :new
    
    def create
      super do |user|
        user.plan_id = params[:plan]
      end
    end
  
    private
      def select_plan
        unless params[:plan] == "1" || params[:plan] == "2"
          flash[:notice] = "Please select a plan and sign up."
          redirect_to root_url
        end
      end
end