require 'httparty'

class FortniteClient
    def initialize(email, password)
        csrf = HTTParty.get('https://www.epicgames.com/id/api/csrf')
        cookie = "EPIC_FUNNEL_ID=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[1]}; EPIC_DEVICE=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[24]}; EPIC_SESSION_ID=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[47]}; XSRF-TOKEN=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[54]}; EPIC_SSO_SESSION=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[59]}"
        
        headers = {"x-xsrf-token" => csrf.headers['Set-Cookie'].split(/[\s=;]/)[54], "Cookie" => cookie}
        body = {'email': email, 'password': password, 'rememberMe': false}
        login = HTTParty.post("https://www.epicgames.com/id/api/login", :headers => headers, :body => body)
        cookie = "EPIC_FUNNEL_ID=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[1]}; EPIC_DEVICE=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[24]}; EPIC_SESSION_ID=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[47]}; XSRF-TOKEN=#{csrf.headers['Set-Cookie'].split(/[\s=;]/)[54]}; EPIC_SSO_SESSION=#{login.headers['Set-Cookie'].split(/[\s=;]/)[1]}"
        
        headers = {"x-xsrf-token" => csrf.headers['Set-Cookie'].split(/[\s=;]/)[54], "Cookie" => cookie}
        exchange = HTTParty.get('https://www.epicgames.com/id/api/exchange', :headers => headers)
        
        headers = {"Authorization" => 'basic MzQ0NmNkNzI2OTRjNGE0NDg1ZDgxYjc3YWRiYjIxNDE6OTIwOWQ0YTVlMjVhNDU3ZmI5YjA3NDg5ZDMxM2I0MWE='}
        body = {'grant_type': 'exchange_code', 'token_type': 'eg1', 'exchange_code': JSON.parse(exchange.body)['code']}
        token = HTTParty.post("https://account-public-service-prod03.ol.epicgames.com/account/api/oauth/token", :headers => headers, :body => body)
        @launcherauth = JSON.parse(token.body)['access_token']

        headers = {"Authorization" => "Bearer #{JSON.parse(token.body)['access_token']}"}
        fortniteExchange = HTTParty.get("https://account-public-service-prod03.ol.epicgames.com/account/api/oauth/exchange", :headers => headers)

        headers = {"Authorization" => 'basic ZWM2ODRiOGM2ODdmNDc5ZmFkZWEzY2IyYWQ4M2Y1YzY6ZTFmMzFjMjExZjI4NDEzMTg2MjYyZDM3YTEzZmM4NGQ='}
        body = {'grant_type': 'exchange_code', 'token_type': 'eg1', 'exchange_code': JSON.parse(fortniteExchange.body)['code']}
        fortniteToken = HTTParty.post("https://account-public-service-prod03.ol.epicgames.com/account/api/oauth/token", :headers => headers, :body => body)

        headers = {"Authorization" => "bearer #{JSON.parse(fortniteToken.body)['access_token']}"}
        account = HTTParty.get("https://account-public-service-prod03.ol.epicgames.com/account/api/public/account/#{JSON.parse(fortniteToken.body)['account_id']}", :headers => headers)
        @token = JSON.parse(fortniteToken.body)['access_token']

        body = JSON.parse(account.body)
        
        body.each do |name, value|
            instance_variable_set("@#{name}", value)
        end

    end

    attr_reader :displayName
    attr_reader :id
    attr_reader :token

end