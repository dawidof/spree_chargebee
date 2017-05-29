module ChargebeeFetcher
  class Card
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def card_expired?
      response.status.eql? 'expired' if response
    end

    def card_will_expire_soon?
      response.status.eql? 'expiring' if response
    end

    def method_missing(method)
      response.send(method)
    end
  end
end
