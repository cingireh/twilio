##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Studio < Domain
      class V1 < Version
        class FlowContext < InstanceContext
          class EngagementContext < InstanceContext
            class StepList < ListResource
              ##
              # Initialize the StepList
              # @param [Version] version Version that contains the resource
              # @param [String] flow_sid The unique SID identifier of the Flow.
              # @param [String] engagement_sid The unique SID identifier of the Engagement.
              # @return [StepList] StepList
              def initialize(version, flow_sid: nil, engagement_sid: nil)
                super(version)

                # Path Solution
                @solution = {flow_sid: flow_sid, engagement_sid: engagement_sid}
                @uri = "/Flows/#{@solution[:flow_sid]}/Engagements/#{@solution[:engagement_sid]}/Steps"
              end

              ##
              # Lists StepInstance records from the API as a list.
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
              # Streams StepInstance records from the API as an Enumerable.
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
              # When passed a block, yields StepInstance records from the API.
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
              # Retrieve a single page of StepInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of StepInstance
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
                StepPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of StepInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of StepInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                StepPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Studio.V1.StepList>'
              end
            end

            class StepPage < Page
              ##
              # Initialize the StepPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [StepPage] StepPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of StepInstance
              # @param [Hash] payload Payload response from the API
              # @return [StepInstance] StepInstance
              def get_instance(payload)
                StepInstance.new(
                    @version,
                    payload,
                    flow_sid: @solution[:flow_sid],
                    engagement_sid: @solution[:engagement_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Studio.V1.StepPage>'
              end
            end

            class StepContext < InstanceContext
              ##
              # Initialize the StepContext
              # @param [Version] version Version that contains the resource
              # @param [String] flow_sid The unique SID identifier of the Flow.
              # @param [String] engagement_sid The unique SID identifier of the Engagement.
              # @param [String] sid The unique SID identifier of the Step.
              # @return [StepContext] StepContext
              def initialize(version, flow_sid, engagement_sid, sid)
                super(version)

                # Path Solution
                @solution = {flow_sid: flow_sid, engagement_sid: engagement_sid, sid: sid, }
                @uri = "/Flows/#{@solution[:flow_sid]}/Engagements/#{@solution[:engagement_sid]}/Steps/#{@solution[:sid]}"

                # Dependents
                @step_context = nil
              end

              ##
              # Fetch a StepInstance
              # @return [StepInstance] Fetched StepInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                StepInstance.new(
                    @version,
                    payload,
                    flow_sid: @solution[:flow_sid],
                    engagement_sid: @solution[:engagement_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Access the step_context
              # @return [StepContextList]
              # @return [StepContextContext]
              def step_context
                StepContextContext.new(@version, @solution[:flow_sid], @solution[:engagement_sid], @solution[:sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Studio.V1.StepContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Studio.V1.StepContext #{context}>"
              end
            end

            class StepInstance < InstanceResource
              ##
              # Initialize the StepInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] flow_sid The unique SID identifier of the Flow.
              # @param [String] engagement_sid The unique SID identifier of the Engagement.
              # @param [String] sid The unique SID identifier of the Step.
              # @return [StepInstance] StepInstance
              def initialize(version, payload, flow_sid: nil, engagement_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'flow_sid' => payload['flow_sid'],
                    'engagement_sid' => payload['engagement_sid'],
                    'name' => payload['name'],
                    'context' => payload['context'],
                    'transitioned_from' => payload['transitioned_from'],
                    'transitioned_to' => payload['transitioned_to'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                    'links' => payload['links'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'flow_sid' => flow_sid,
                    'engagement_sid' => engagement_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [StepContext] StepContext for this StepInstance
              def context
                unless @instance_context
                  @instance_context = StepContext.new(
                      @version,
                      @params['flow_sid'],
                      @params['engagement_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this Step.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Flow Sid.
              def flow_sid
                @properties['flow_sid']
              end

              ##
              # @return [String] Engagement Sid.
              def engagement_sid
                @properties['engagement_sid']
              end

              ##
              # @return [String] The event that caused the flow to transition to this Step.
              def name
                @properties['name']
              end

              ##
              # @return [Hash] The context
              def context
                @properties['context']
              end

              ##
              # @return [String] The Widget that preceded the Widget for this Step.
              def transitioned_from
                @properties['transitioned_from']
              end

              ##
              # @return [String] The Widget that will follow the Widget for this Step.
              def transitioned_to
                @properties['transitioned_to']
              end

              ##
              # @return [Time] The date this Step was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this Step was updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # @return [String] The links
              def links
                @properties['links']
              end

              ##
              # Fetch a StepInstance
              # @return [StepInstance] Fetched StepInstance
              def fetch
                context.fetch
              end

              ##
              # Access the step_context
              # @return [step_context] step_context
              def step_context
                context.step_context
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Studio.V1.StepInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Studio.V1.StepInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end