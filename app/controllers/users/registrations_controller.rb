#BEFORE saving the User, check which plan they have.


class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default devise gem behavior so that
  # Users signing up with the Pro account (Plan_id ==2)
  # save with a special Stripe subscription function
  # Otherwise, devise signs up user as usual
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