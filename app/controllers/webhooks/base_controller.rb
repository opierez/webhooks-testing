class Webhooks::BaseController < ApplicationController

    # Disable CSRF checks on webhooks bc they don;t originate from the browser
    skip_forgery_protection 

    before_action :verify_event 

    def create 
        InboundWebhook.create!(body: payload)
        head :ok 
    end

    private 

    def verify_event 
        head :bad_request 
    end

    def payload 
        @payload ||= request.body.read
    end

end
