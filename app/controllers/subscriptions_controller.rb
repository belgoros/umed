class SubscriptionsController < ApplicationController
  before_filter :setup_plan, only: [:express_checkout, :new]

  def index
    @subscriptions = current_user.subscriptions.order(start_date: :desc).page params[:page]
  end

  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@plan.total_in_cents,
        ip: request.remote_ip,
        return_url: new_subscription_url,
        cancel_return_url: subscriptions_url,
        currency: "EUR",
        allow_guest_checkout: true,
        locale: 'FR',
        items: [{name: I18n.t('subscriptions.new.title'),
                description: @plan.description,
                quantity: "1",
                amount: @plan.total_in_cents}]
      )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def new
    @subscription = current_user.subscriptions.new(express_token: params[:token])
    @subscription.enroll_for_plan(@plan)
  end

  def create
    @subscription = current_user.subscriptions.new(subscription_params)
    if @subscription.save
      if @subscription.purchase
        UserMailer.new_subscription_email(@subscription).deliver_now
        redirect_to subscriptions_url, notice: t(:created_success, model: Subscription.model_name.human)
      else
        render :new, alert: t(:purchase_failure, model: Subscription.model_name.human)
      end
    else
      render :new
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: t(:destroyed_success, model: Subscription.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

    def setup_plan
      if session[:plan_id]
        @plan ||= Plan.find(session[:plan_id])
      end
      if session[:plan_id].nil?
        @plan = Plan.find(params[:plan_id])
        session[:plan_id] = @plan.id
      end
    end

    def subscription_params
      params.require(:subscription).permit(:user_id, :plan_id, :start_date, :end_date, :express_token, :express_payer_id)
    end
end
