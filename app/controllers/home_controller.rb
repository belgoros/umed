class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :load_subscription_plans, only: :index

  def index
  end

  def faq
  end

  private

  def load_subscription_plans
    @plans = Plan.all
  end
end
