##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SipList < ListResource
            class DomainContext < InstanceContext
              class AuthTypesList < ListResource
                class AuthTypeRegistrationsList < ListResource
                  class AuthRegistrationsCredentialListMappingList < ListResource
                    ##
                    # Initialize the AuthRegistrationsCredentialListMappingList
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   SipDomain resource.
                    # @param [String] domain_sid The unique string that that we created to identify
                    #   the SipDomain resource.
                    # @return [AuthRegistrationsCredentialListMappingList] AuthRegistrationsCredentialListMappingList
                    def initialize(version, account_sid: nil, domain_sid: nil)
                      super(version)

                      # Path Solution
                      @solution = {account_sid: account_sid, domain_sid: domain_sid}
                      @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Registrations/CredentialListMappings.json"
                    end

                    ##
                    # Retrieve a single page of AuthRegistrationsCredentialListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] credential_list_sid The SID of the CredentialList resource to
                    #   map to the SIP domain.
                    # @return [AuthRegistrationsCredentialListMappingInstance] Newly created AuthRegistrationsCredentialListMappingInstance
                    def create(credential_list_sid: nil)
                      data = Twilio::Values.of({'CredentialListSid' => credential_list_sid, })

                      payload = @version.create(
                          'POST',
                          @uri,
                          data: data
                      )

                      AuthRegistrationsCredentialListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                      )
                    end

                    ##
                    # Lists AuthRegistrationsCredentialListMappingInstance records from the API as a list.
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
                    # Streams AuthRegistrationsCredentialListMappingInstance records from the API as an Enumerable.
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
                    # When passed a block, yields AuthRegistrationsCredentialListMappingInstance records from the API.
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
                    # Retrieve a single page of AuthRegistrationsCredentialListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AuthRegistrationsCredentialListMappingInstance
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
                      AuthRegistrationsCredentialListMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AuthRegistrationsCredentialListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AuthRegistrationsCredentialListMappingInstance
                    def get_page(target_url)
                      response = @version.domain.request(
                          'GET',
                          target_url
                      )
                      AuthRegistrationsCredentialListMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      '#<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingList>'
                    end
                  end

                  class AuthRegistrationsCredentialListMappingPage < Page
                    ##
                    # Initialize the AuthRegistrationsCredentialListMappingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AuthRegistrationsCredentialListMappingPage] AuthRegistrationsCredentialListMappingPage
                    def initialize(version, response, solution)
                      super(version, response)

                      # Path Solution
                      @solution = solution
                    end

                    ##
                    # Build an instance of AuthRegistrationsCredentialListMappingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AuthRegistrationsCredentialListMappingInstance] AuthRegistrationsCredentialListMappingInstance
                    def get_instance(payload)
                      AuthRegistrationsCredentialListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                      )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      '<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingPage>'
                    end
                  end

                  class AuthRegistrationsCredentialListMappingContext < InstanceContext
                    ##
                    # Initialize the AuthRegistrationsCredentialListMappingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   CredentialListMapping resource to fetch.
                    # @param [String] domain_sid The SID of the SIP domain that contains the resource
                    #   to fetch.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the
                    #   CredentialListMapping resource to fetch.
                    # @return [AuthRegistrationsCredentialListMappingContext] AuthRegistrationsCredentialListMappingContext
                    def initialize(version, account_sid, domain_sid, sid)
                      super(version)

                      # Path Solution
                      @solution = {account_sid: account_sid, domain_sid: domain_sid, sid: sid, }
                      @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Registrations/CredentialListMappings/#{@solution[:sid]}.json"
                    end

                    ##
                    # Fetch a AuthRegistrationsCredentialListMappingInstance
                    # @return [AuthRegistrationsCredentialListMappingInstance] Fetched AuthRegistrationsCredentialListMappingInstance
                    def fetch
                      params = Twilio::Values.of({})

                      payload = @version.fetch(
                          'GET',
                          @uri,
                          params,
                      )

                      AuthRegistrationsCredentialListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                          sid: @solution[:sid],
                      )
                    end

                    ##
                    # Deletes the AuthRegistrationsCredentialListMappingInstance
                    # @return [Boolean] true if delete succeeds, true otherwise
                    def delete
                      @version.delete('delete', @uri)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                      "#<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                      context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                      "#<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingContext #{context}>"
                    end
                  end

                  class AuthRegistrationsCredentialListMappingInstance < InstanceResource
                    ##
                    # Initialize the AuthRegistrationsCredentialListMappingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   SipDomain resource.
                    # @param [String] domain_sid The unique string that that we created to identify
                    #   the SipDomain resource.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the
                    #   CredentialListMapping resource to fetch.
                    # @return [AuthRegistrationsCredentialListMappingInstance] AuthRegistrationsCredentialListMappingInstance
                    def initialize(version, payload, account_sid: nil, domain_sid: nil, sid: nil)
                      super(version)

                      # Marshaled Properties
                      @properties = {
                          'account_sid' => payload['account_sid'],
                          'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                          'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                          'friendly_name' => payload['friendly_name'],
                          'sid' => payload['sid'],
                      }

                      # Context
                      @instance_context = nil
                      @params = {
                          'account_sid' => account_sid,
                          'domain_sid' => domain_sid,
                          'sid' => sid || @properties['sid'],
                      }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AuthRegistrationsCredentialListMappingContext] AuthRegistrationsCredentialListMappingContext for this AuthRegistrationsCredentialListMappingInstance
                    def context
                      unless @instance_context
                        @instance_context = AuthRegistrationsCredentialListMappingContext.new(
                            @version,
                            @params['account_sid'],
                            @params['domain_sid'],
                            @params['sid'],
                        )
                      end
                      @instance_context
                    end

                    ##
                    # @return [String] The SID of the Account that created the resource
                    def account_sid
                      @properties['account_sid']
                    end

                    ##
                    # @return [Time] The RFC 2822 date and time in GMT that the resource was created
                    def date_created
                      @properties['date_created']
                    end

                    ##
                    # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
                    def date_updated
                      @properties['date_updated']
                    end

                    ##
                    # @return [String] The string that you assigned to describe the resource
                    def friendly_name
                      @properties['friendly_name']
                    end

                    ##
                    # @return [String] The unique string that identifies the resource
                    def sid
                      @properties['sid']
                    end

                    ##
                    # Fetch a AuthRegistrationsCredentialListMappingInstance
                    # @return [AuthRegistrationsCredentialListMappingInstance] Fetched AuthRegistrationsCredentialListMappingInstance
                    def fetch
                      context.fetch
                    end

                    ##
                    # Deletes the AuthRegistrationsCredentialListMappingInstance
                    # @return [Boolean] true if delete succeeds, true otherwise
                    def delete
                      context.delete
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                      "<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                      values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                      "<Twilio.Api.V2010.AuthRegistrationsCredentialListMappingInstance #{values}>"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end