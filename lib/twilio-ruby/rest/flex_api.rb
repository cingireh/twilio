##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class FlexApi < Domain
      ##
      # Initialize the FlexApi Domain
      def initialize(twilio)
        super

        @base_url = 'https://flex-api.twilio.com'
        @host = 'flex-api.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of flex_api
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique ID of the FlexFlow
      # @return [Twilio::REST::Flex_api::V1::FlexFlowInstance] if sid was passed.
      # @return [Twilio::REST::Flex_api::V1::FlexFlowList]
      def flex_flow(sid=:unset)
        self.v1.flex_flow(sid)
      end

      ##
      # @return [Twilio::REST::Flex_api::V1::ConfigurationInstance]
      def configuration
        self.v1.configuration()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::FlexApi>'
      end
    end
  end
end