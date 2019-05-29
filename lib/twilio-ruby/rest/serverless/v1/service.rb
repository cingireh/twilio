##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] unique_name A unique, addressable name of this Service which
          #   forms part of the domain name, fewer than 256 characters. Required.
          # @param [String] friendly_name A human-readable description of this Service,
          #   fewer than 256 characters. Required
          # @param [Boolean] include_credentials A boolean value that indicates whether to
          #   inject Account credentials into a Function invocation context. Optional, default
          #   `false`.
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(unique_name: nil, friendly_name: nil, include_credentials: :unset)
            data = Twilio::Values.of({
                'UniqueName' => unique_name,
                'FriendlyName' => friendly_name,
                'IncludeCredentials' => include_credentials,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Serverless.V1.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Serverless.V1.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid Identifier of the Serverless Service Instance. Either a SID
          #   or UniqueName.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @environments = nil
            @functions = nil
            @assets = nil
            @builds = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the ServiceInstance
          # @param [Boolean] include_credentials A boolean value that indicates whether to
          #   inject Account credentials into a Function invocation context. Optional.
          # @param [String] friendly_name A human-readable description of this Service,
          #   fewer than 256 characters. Optional
          # @return [ServiceInstance] Updated ServiceInstance
          def update(include_credentials: :unset, friendly_name: :unset)
            data = Twilio::Values.of({
                'IncludeCredentials' => include_credentials,
                'FriendlyName' => friendly_name,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the environments
          # @return [EnvironmentList]
          # @return [EnvironmentContext] if sid was passed.
          def environments(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return EnvironmentContext.new(@version, @solution[:sid], sid, )
            end

            unless @environments
              @environments = EnvironmentList.new(@version, service_sid: @solution[:sid], )
            end

            @environments
          end

          ##
          # Access the functions
          # @return [FunctionList]
          # @return [FunctionContext] if sid was passed.
          def functions(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return FunctionContext.new(@version, @solution[:sid], sid, )
            end

            unless @functions
              @functions = FunctionList.new(@version, service_sid: @solution[:sid], )
            end

            @functions
          end

          ##
          # Access the assets
          # @return [AssetList]
          # @return [AssetContext] if sid was passed.
          def assets(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return AssetContext.new(@version, @solution[:sid], sid, )
            end

            unless @assets
              @assets = AssetList.new(@version, service_sid: @solution[:sid], )
            end

            @assets
          end

          ##
          # Access the builds
          # @return [BuildList]
          # @return [BuildContext] if sid was passed.
          def builds(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return BuildContext.new(@version, @solution[:sid], sid, )
            end

            unless @builds
              @builds = BuildList.new(@version, service_sid: @solution[:sid], )
            end

            @builds
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Serverless.V1.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Serverless.V1.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid Identifier of the Serverless Service Instance. Either a SID
          #   or UniqueName.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'unique_name' => payload['unique_name'],
                'include_credentials' => payload['include_credentials'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] Service Sid.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] Account Sid.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] A human-readable description of this Service.
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] A unique, URL-friendly name of this Service.
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [Boolean] Whether to inject Account credentials into a Function invocation context.
          def include_credentials
            @properties['include_credentials']
          end

          ##
          # @return [Time] The date that this Service was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date that this Service was updated.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The URL of this Service.
          def url
            @properties['url']
          end

          ##
          # @return [String] Nested resource URLs.
          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Update the ServiceInstance
          # @param [Boolean] include_credentials A boolean value that indicates whether to
          #   inject Account credentials into a Function invocation context. Optional.
          # @param [String] friendly_name A human-readable description of this Service,
          #   fewer than 256 characters. Optional
          # @return [ServiceInstance] Updated ServiceInstance
          def update(include_credentials: :unset, friendly_name: :unset)
            context.update(include_credentials: include_credentials, friendly_name: friendly_name, )
          end

          ##
          # Access the environments
          # @return [environments] environments
          def environments
            context.environments
          end

          ##
          # Access the functions
          # @return [functions] functions
          def functions
            context.functions
          end

          ##
          # Access the assets
          # @return [assets] assets
          def assets
            context.assets
          end

          ##
          # Access the builds
          # @return [builds] builds
          def builds
            context.builds
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Serverless.V1.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Serverless.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end