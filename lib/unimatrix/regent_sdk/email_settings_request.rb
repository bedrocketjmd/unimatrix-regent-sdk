module Unimatrix
  
  module RegentSdk
    
    class EmailSettingsRequest
      
      def initialize( realm_uuid, access_token )
        @realm_uuid   = realm_uuid
        @access_token = access_token
      end
      
      def retrieve
        request = Request.new( 
                    '/realms/' + @realm_uuid, 
                    { access_token: @access_token, include_settings: true } 
                  )
                  
        response = request.get
        
        if response.success?
          all_realm_settings = response.settings
          if all_realm_settings.respond_to?( :select )
            email_settings = all_realm_settings.select { | setting | setting[ 'name' ][ 0..5 ] == 'email_' }
          else
            email_settings = []
          end
          
          email_settings
        end
      end
      
    end
    
  end
  
end
  