class MailchimpSubscribeWorker
  include Sidekiq::Worker

  def perform(subscriber_id)
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.mailchimp[:api_key])
    subscriber = Subscriber.find subscriber_id
    gibbon.lists(Rails.application.credentials.mailchimp[:list_id]).members.create(body: {email_address: subscriber.email, status: "subscribed", merge_fields: {FNAME: subscriber.name, LNAME: ""}})
  end
end
