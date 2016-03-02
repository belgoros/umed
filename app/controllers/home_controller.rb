class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :load_subscription_plans

  def index
  end

  private

  def load_subscription_plans
    @plans = Plan.all
  end
end
