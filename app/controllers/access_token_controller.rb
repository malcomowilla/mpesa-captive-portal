class AccessTokenController < ApplicationController

    def fetch_token
        api_url = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'
        consumer_key = ENV["CONSUMER_KEY"]
        consumer_secret = ENV["CONSUMER_SECRET"]
    
        # Make a GET request to the OAuth endpoint
        response = RestClient.get(api_url, { params: { grant_type: 'client_credentials' }, Authorization: "Basic #{Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")}" })
    
        # Parse the JSON response and extract the access token
        access_token = JSON.parse(response.body)['access_token']
    
        render json: { access_token: access_token }
      rescue RestClient::ExceptionWithResponse => e
        render json: { error: "Failed to fetch access token. #{e.response}" }, status: :unprocessable_entity
      end

end
