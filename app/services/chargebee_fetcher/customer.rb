module ChargebeeFetcher
  class Customer
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def billing_address
      response.try(&:billing_address)
    end

    def has_card?
      response.try(:card_status) != 'no_card'
    end

    def method_missing(method)
      response.send(method)
    end
  end
end
