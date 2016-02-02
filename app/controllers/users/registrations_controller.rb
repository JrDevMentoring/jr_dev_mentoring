class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :select_plan, only: :new
    
    def create
      super do |user|
        user.plan_id = params[:plan].to_i
      end
    end
  
    private
      def select_plan
        unless params[:plan] == Plan.find_by_name('mentor').id.to_s || params[:plan] == Plan.find_by_name('mentee').id.to_s
          flash[:notice] = "Please select a plan and sign up."
          redirect_to root_url
        end
      end
end