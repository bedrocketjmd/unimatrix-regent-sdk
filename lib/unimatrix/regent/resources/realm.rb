module Unimatrix::Regent
  
  class Realm < Base
    field    :id
    field    :uuid
    field    :type_name
    field    :name
    field    :code_name
    field    :domain_name
    field    :created_at
    field    :updated_at
    
    has_many :settings
  end
  
end