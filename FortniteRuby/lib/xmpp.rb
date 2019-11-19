require 'httparty'
require 'xmpp4r'

class XMPPClient
    def initialize(user_id)
        resource_id = SecureRandom.hex.upcase
        jid = Jabber::JID.new("#{user_id}@prod.ol.epicgames.com/V2:Fortnite:WIN::#{resource_id}")
        puts jid
    end
end
