class Webhooks::BaseController < ApplicationController

    # Disable CSRF checks on webhooks bc they don;t originate from the browser
    skip_forgery_protection 

    def create 
        InboundWebhook.create!(body: payload)
        head :ok 
    end

    
    def payload 
        @payload ||= request.body.read
    end

end
