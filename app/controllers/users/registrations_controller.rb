#BEFORE saving the User, check which plan they have.


class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      # Is there a parameter Plan1 or Plan2 in the URL... meaning 
      # is this coming from a devise form
      if params[:plan]
        resource.plan_id = params[:plan]
        #if they're coming from Pro form, save user with a subscription
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end