class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.subscriptions.order(start_date: :desc).page params[:page]
  end

  def express_checkout
    @subscription = current_user.subscriptions.new
    response = EXPRESS_GATEWAY.setup_purchase(@subscription.to_cents,
        ip: request.remote_ip,
        return_url: new_subscription_url,
        cancel_return_url: subscriptions_url,
        currency: "EUR",
        allow_guest_checkout: true,
        items: [{name: "New Subscription", description: "Montly subscription", quantity: "1", amount: @subscription.to_cents}]
      )
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
    @subscription = current_user.subscriptions.new(express_token: params[:token])
  end


  def create
    @subscription = current_user.subscriptions.new
    if @subscription.save
      if @subscription.purchase
        redirect_to subscription_url(@subscription)
      else
        redirect_to subscriptions_url
      end
    else
      render :new
    end
  end

  private

    def subscription_params
      params.require(:subscription).permit(:user_id)
    end
end
