##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Monitor < Domain
      class V1 < Version
        class AlertList < ListResource
          ##
          # Initialize the AlertList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Alerts"
          end
          
          ##
          # Reads AlertInstance records from the API as a list.
          def list(log_level: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, limit: nil, page_size: nil)
            self.stream(
                log_level: log_level,
                start_date_before: start_date_before,
                start_date: start_date,
                start_date_after: start_date_after,
                end_date_before: end_date_before,
                end_date: end_date,
                end_date_after: end_date_after,
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          def stream(log_level: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                log_level: log_level,
                start_date_before: start_date_before,
                start_date: start_date,
                start_date_after: start_date_after,
                end_date_before: end_date_before,
                end_date: end_date,
                end_date_after: end_date_after,
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          def each
            limits = @version.read_limits
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page,
                            limit: limits['limit'],
                            page_limit: limits['page_limit']).each {|x| yield x}
          end
          
          ##
          # Retrieve a single page of AlertInstance records from the API.
          def page(log_level: nil, start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, page_token: nil, page_number: nil, page_size: nil)
            params = {
                'LogLevel' => log_level,
                'StartDate<' => Twilio.serialize_iso8601(start_date_before),
                'StartDate' => Twilio.serialize_iso8601(start_date),
                'StartDate>' => Twilio.serialize_iso8601(start_date_after),
                'EndDate<' => Twilio.serialize_iso8601(end_date_before),
                'EndDate' => Twilio.serialize_iso8601(end_date),
                'EndDate>' => Twilio.serialize_iso8601(end_date_after),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return AlertPage.new(
                @version,
                response,
            )
          end
          
          ##
          # Constructs a AlertContext
          def get(sid)
            AlertContext.new(
                @version,
                sid: sid,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Monitor.V1.AlertList>'
          end
        end
      
        class AlertPage < Page
          def initialize(version, response)
            super(version, response)
            
            # Path Solution
            @solution = {}
          end
          
          def get_instance(payload)
            return AlertInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Monitor.V1.AlertPage>'
          end
        end
      
        class AlertContext < InstanceContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Alerts/#{@solution[:sid]}"
          end
          
          ##
          # Fetch a AlertInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return AlertInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Deletes the AlertInstance
          def delete
            return @version.delete('delete', @uri)
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Monitor.V1.AlertContext #{context}>"
          end
        end
      
        class AlertInstance < InstanceResource
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'alert_text' => payload['alert_text'],
                'api_version' => payload['api_version'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_generated' => Twilio.deserialize_iso8601(payload['date_generated']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'error_code' => payload['error_code'],
                'log_level' => payload['log_level'],
                'more_info' => payload['more_info'],
                'request_method' => payload['request_method'],
                'request_url' => payload['request_url'],
                'resource_sid' => payload['resource_sid'],
                'sid' => payload['sid'],
                'url' => payload['url'],
                'request_variables' => payload['request_variables'],
                'response_body' => payload['response_body'],
                'response_headers' => payload['response_headers'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          def context
            unless @instance_context
              @instance_context = AlertContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def alert_text
            @properties['alert_text']
          end
          
          def api_version
            @properties['api_version']
          end
          
          def date_created
            @properties['date_created']
          end
          
          def date_generated
            @properties['date_generated']
          end
          
          def date_updated
            @properties['date_updated']
          end
          
          def error_code
            @properties['error_code']
          end
          
          def log_level
            @properties['log_level']
          end
          
          def more_info
            @properties['more_info']
          end
          
          def request_method
            @properties['request_method']
          end
          
          def request_url
            @properties['request_url']
          end
          
          def request_variables
            @properties['request_variables']
          end
          
          def resource_sid
            @properties['resource_sid']
          end
          
          def response_body
            @properties['response_body']
          end
          
          def response_headers
            @properties['response_headers']
          end
          
          def sid
            @properties['sid']
          end
          
          def url
            @properties['url']
          end
          
          ##
          # Fetch a AlertInstance
          def fetch
            @context.fetch()
          end
          
          ##
          # Deletes the AlertInstance
          def delete
            @context.delete()
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Monitor.V1.AlertInstance #{context}>"
          end
        end
      end
    end
  end
end