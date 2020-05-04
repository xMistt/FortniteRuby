require 'httparty'

class FortniteClient
    def authenticate()
        # Function to authenticate with the Epic Games API through exchange code.
        login = HTTParty.post(
            "https://account-public-service-prod.ol.epicgames.com/account/api/oauth/token",
            :headers => {
                "Content-Type" => "application/x-www-form-urlencoded",
                "Authorization" => "basic ZWM2ODRiOGM2ODdmNDc5ZmFkZWEzY2IyYWQ4M2Y1YzY6ZTFmMzFjMjExZjI4NDEzMTg2MjYyZDM3YTEzZmM4NGQ="
            },
            :body => {
                "grant_type" => "exchange_code",
                "exchange_code" => @_exchange_code
            },
            # :debug_output => $stdout
        )

        @display_name = JSON.parse(login.body)['displayName']
        @access_token = JSON.parse(login.body)['access_token']
    end

    def initialize(exchange_code=nil)
        if exchange_code == nil # Prompts an input for the exchange code if none is provided.
            puts 'Please enter an exchange code:'
            exchange_code = gets.chomp
        end

        @_exchange_code = exchange_code
    end

    # Private attributes (not intended to be used outside of the object itself).
    attr_accessor :_exchange_code

    # Public attributes.
    attr_accessor :display_name
    attr_accessor :access_token
end
