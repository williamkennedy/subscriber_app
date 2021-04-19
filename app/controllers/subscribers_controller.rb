class SubscribersController < ApplicationController

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # POST /subscribers or /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        MailchimpSubscribeWorker.perform_async(@subscriber.id)
        format.html { redirect_to thank_you_subscribers_path, notice: "Subscriber was successfully created." }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def thank_you
  end

  private
    # Only allow a list of trusted parameters through.
    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end
end
