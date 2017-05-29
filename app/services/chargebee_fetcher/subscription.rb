module ChargebeeFetcher
  class Subscription
    attr_reader :response
    delegate :billing_address, :has_card?, to: :customer, allow_nil: true
    delegate :card_expired?, :card_will_expire_soon?, to: :card

    def initialize(response)
      @response = response
    end

    def self.find_by(**options)
      where(options).first
    end

    def self.where(**options)
      conditions = options.each_with_object({}) do |(key, value), memo|
        next unless value

        internal_condition = value.is_a?(Array) ? :in : :is
        value_to_search = value.is_a?(Array) ? value.to_json : value.to_s
        memo[key] = { internal_condition => value_to_search }
      end

      return [] if conditions.empty?
      ChargeBee::Subscription.list(conditions).map(&method(:new))
    end

    def subscription
      response.subscription if response
    end

    def shipping_address
      subscription.try(:shipping_address)
    end

    def id
      subscription.try(:id)
    end

    def active?
      %w(active future).include? subscription.status
    end

    def cancelled?
      subscription.status.eql?('cancelled')
    end

    def skipped?
      return subscription.current_term_end > 1.month.from_now.to_i if subscription.status.eql?('active')
      return subscription.start_date > 1.month.from_now.to_i if subscription.status.eql?('future')
      false
    end

    def customer
      @customer ||= ChargebeeFetcher::Customer.new(response.customer) if response
    end

    def card
      @card ||= ChargebeeFetcher::Card.new(response.card) if response
    end
  end
end
