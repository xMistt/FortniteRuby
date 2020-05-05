require 'httparty'

FortniteUser = Struct.new(
    :display_name,
    :id,
    :external_auths
)

class FortniteClient
    def initialize(exchange_code=nil)
        if exchange_code # Prompts an input for the exchange code if none is provided.
            @_exchange_code = exchange_code
        else
            puts 'Please enter an exchange code:'
            @_exchange_code = gets.chomp
        end

    end

    def authenticate()
        # Function to authenticate with the Epic Games API through exchange code.
        request = HTTParty.post(
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

        response = JSON.parse(request.body)

        if request.code == 400
            raise "#{response['errorCode']} - #{response['errorMessage']}"
        end

        @display_name = response['displayName']
        @access_token = response['access_token']
    end

    def fetch_account(name)
        # Fetch account information and returns a FortniteUser object.
        request = HTTParty.get(
            "https://account-public-service-prod03.ol.epicgames.com/account/api/public/account/displayName/#{name}",
            :headers => {
                "Authorization" => "bearer #{@access_token}"
            })
        

        response = JSON.parse(request.body)
        
        FortniteUser.new(
            response['displayName'],
            response['id'],
            response['externalAuths']
        )
    end

    # Private attributes (not intended to be used outside of the object itself).
    attr_accessor :_exchange_code

    # Public attributes.
    attr_accessor :display_name
    attr_accessor :access_token
end