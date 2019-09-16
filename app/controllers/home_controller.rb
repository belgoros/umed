class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_subscription_plans, only: :index

  def index
  end

  def faq
  end

  def about
  end

  def credits
  end

  private

  def load_subscription_plans
    @plans = Plan.all
  end
end
