require 'net/http'
require 'json'

REGENT_URL = ENV[ 'REGENT_URL' ]

module Unimatrix
  
  module RegentSdk
    
    class EmailSettingsRequest
      
      def initialize( realm_uuid, access_token )
        @realm_uuid   = realm_uuid
        @access_token = access_token
      end
      
      def retrieve
        uri = URI( REGENT_URL + '/realms/' + @realm_uuid + '?access_token=' + @access_token + '&include[settings]' )
        response = Net::HTTP.get( uri )
        all_realm_settings = JSON.parse( response )[ 'settings' ]
        email_settings = all_realm_settings.select { | setting | setting[ 'name' ][ 0..5 ] == 'email_' }
        email_settings.map do | setting | 
          setting.keep_if { | key, value | [ 'name', 'content' ].include?( key ) } 
          setting[ 'name' ] = setting[ 'name' ][ 6..-1 ]
        end
        
        email_settings
      end
      
    end
    
  end
  
end
  