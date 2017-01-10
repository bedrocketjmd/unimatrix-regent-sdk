# coding: utf-8
lib = File.expand_path( '../lib/', __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )
require 'unimatrix/regent/version'

Gem::Specification.new do | spec |
  spec.name          = "unimatrix-regent"
  spec.version       = Unimatrix::Regent::VERSION
  spec.homepage      = "http://sportsrocket.com"
  spec.authors       = [ "Matthew Yang" ]
  spec.email         = [ "matthewyang@sportsrocket.com" ]
  spec.summary       = "Unimatrix::Regent is used to communicate with Regent."
  spec.description   = "The unimatrix-regent facilitates making requests to the Unimatrix Regent application"
  spec.license       = "MIT"
  
  spec.require_paths = [ "lib" ]
  spec.files         = Dir.glob( "{lib}/**/*" )
  
  spec.add_runtime_dependency( "activesupport", ">= 4.2" )
  spec.add_runtime_dependency( "addressable" )
  spec.add_runtime_dependency( "fnv", "~> 0.2" )
  
  spec.add_development_dependency( "pry", "~> 0.10.1" )
  spec.add_development_dependency( "pry-nav" )
end
