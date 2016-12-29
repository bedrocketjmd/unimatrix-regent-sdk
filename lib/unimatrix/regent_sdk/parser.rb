module Unimatrix::RegentSdk
  
  class Parser
    
    def initialize( content = {} )
      @content = content
      yield self if block_given?
    end

    def name
      @content.include?( '$this' ) ?
        @content[ '$this' ][ 'name' ] :
        nil
    end

    def type_name
      @content.include?( '$this' ) ?
        @content[ '$this' ][ 'type_name' ] :
        nil
    end
    
    def settings
      result = []
      
      if @content[ 'settings' ]
        result = @content[ 'settings' ]
      end
      
      result
    end
  end
end