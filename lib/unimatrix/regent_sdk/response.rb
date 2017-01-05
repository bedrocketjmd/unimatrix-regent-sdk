module Unimatrix::RegentSdk
  
  class Response
    
    attr_reader :code
    attr_reader :body
    attr_reader :settings

    def initialize( http_response )
      @success        = http_response.is_a?( Net::HTTPOK )
      @code           = http_response.code
      @settings       = []
      @email_settings = []
      @body           = decode_response_body( http_response )

      if ( @body && @body.respond_to?( :keys ) )
        Parser.new( @body ) do | parser |
          @settings       = parser.settings
          @success        = !( parser.type_name == 'error' )
        end
      else
        @success  = false
        @settings << Error.new(
          message: "#{ @code }: #{ http_response.message }."
        )
      end
    end

    def success?
      @success
    end

    protected; def decode_response_body( http_response )
      body = http_response.body

      if body.present?
        JSON.parse( body ) rescue nil
      else
        nil
      end
    end
    
  end
  
end