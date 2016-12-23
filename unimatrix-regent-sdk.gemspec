# coding: utf-8
lib = File.expand_path( '../lib/', __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )
require 'unimatrix/regent_sdk/version'

Gem::Specification.new do | spec |
  spec.name          = "unimatrix-regent-sdk"
  spec.version       = Unimatrix::RegentSdk::VERSION
  spec.homepage      = "http://sportsrocket.com"
  spec.authors       = [ "Matthew Yang" ]
  spec.email         = [ "matthewyang@sportsrocket.com" ]
  spec.summary       = "Unimatrix::RegentSdk is used to communicate with Regent."
  spec.description   = "The unimatrix-regent-sdk facilitates making requests to the Unimatrix Regent application"
  spec.license       = "MIT"
  
  spec.require_paths = [ "lib" ]
  spec.files         = Dir.glob( "{lib}/**/*" )
  
  spec.add_development_dependency( "pry", "~> 0.10.1" )
end
