require 'net/http'
require 'addressable/uri'

module Unimatrix::Regent

  class Request

    def initialize( default_parameters = {} )
      uri   = URI( Unimatrix::Regent.configuration.url )
      @http = Net::HTTP.new( uri.host, uri.port )
      
      @http.use_ssl = ( uri.scheme == 'https' )
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      @default_parameters = default_parameters.stringify_keys
    end

    def get( path, parameters = {} )
      response = nil

      begin
        response = Response.new(
          @http.get( compose_request_path( path, parameters ) )
        )
      rescue Timeout::Error
        response = nil
      end

      response
    end

    protected; def compose_request_path( path, parameters = {} )
      parameters        = @default_parameters.merge( parameters.stringify_keys )
      addressable       = Addressable::URI.new
      
      addressable.path  = path
      addressable.query = parameters.to_param unless parameters.blank?

      addressable.to_s
    end

  end

end