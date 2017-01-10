module Unimatrix::Regent
  
  class Setting < Base
    field   :id
    field   :type_name
    field   :name
    field   :content
    field   :created_at
    field   :updated_at
    field   :realm_uuid
    
    has_one :realm
  end
  
end