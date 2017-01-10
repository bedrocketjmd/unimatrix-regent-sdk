# Unimatrix Regent SDK

## Installation
Add this line to your applications Gemfile:

```ruby
gem 'unimatrix-regent'
```

And then execute:

	$ bundle
	
	
## How to use

* The Regent SDK requires the following environment variable:

```
REGENT_URL=https://regent.boxxspring.com
```

### Realms Index Request
Returns the first 10 realms in the databse as an array of Realm objects.

__Required Parameters__

* Path: `'/realms'`
* Access token with the correct policy (Resource Server: Regent, Resource: Realms, action: "query")

```ruby
request = Unimatrix::Regent::Operation.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
)

response = request.query
```

__Response Format__

```ruby
[#<Unimatrix::Regent::Realm:0x007fd1cb433fb0
  @code_name="boxxspring-documentation-library",
  @created_at="2016-12-04T20:04:20.774Z",
  @domain_name="nil",
  @id=1,
  @name="Boxxspring Documentation Library",
  @type_name="realm",
  @updated_at="2016-12-04T20:04:20.774Z",
  @uuid="8ca59e2e39f5370e8db640546dbff413">,
 #<Unimatrix::Regent::Realm:0x007fd1cb433790
  @code_name="turbine-demo",
  @created_at="2016-12-04T20:04:20.833Z",
  @domain_name="nil",
  @id=2,
  @name="Turbine Demo",
  @type_name="realm",
  @updated_at="2016-12-04T20:04:20.833Z",
  @uuid="9850d6c59009712d83e804d1ec77c443">,
 #<Unimatrix::Regent::Realm:0x007fd1cb432f48
  @code_name="roku_networka",
  @created_at="2016-12-04T20:04:20.884Z",
  @domain_name="networka.roku.com",
  @id=3,
  @name="Roku Network A",
  @type_name="realm",
  @updated_at="2016-12-04T20:04:20.884Z",
  @uuid="92ad1b22dfba6e766d838c0cd0f76baf">]
```
__Offset__

If there are more than 10 results, to receive the next set of results call `offset` and the offset number (ie. 10 would return results 11-20, if they exist):

```ruby
request = Unimatrix::Regent::Operation.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
).offset( 10 )

response = request.query
```

__Limit__

You can request all returns up to a limit (max 100)

```ruby
request = Unimatrix::Regent::Operation.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
).limit( 25 )

response = request.query
```

### Realm by UUID
Returns information on a specific realm in the format of an array containing the Realm object.

__Required Parameters__

* Path including the realm_uuid: `'/realms/8ca59e2e39f5370e8db640546dbff413'`
* Access token with the correct policy (Resource Server: Regent, Resource: Realms, action: "read")

```ruby
request = Unimatrix::Regent::Operation.new(
  '/realms/8ca59e2e39f5370e8db640546dbff413',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
)

response = request.query
```

__Response Format__

```ruby
[#<Unimatrix::Regent::Realm:0x007fd1cb433fb0
  @code_name="boxxspring-documentation-library",
  @created_at="2016-12-04T20:04:20.774Z",
  @domain_name="nil",
  @id=1,
  @name="Boxxspring Documentation Library",
  @type_name="realm",
  @updated_at="2016-12-04T20:04:20.774Z",
  @uuid="8ca59e2e39f5370e8db640546dbff413">]
```
### Include Settings

Returns an array containing the Realm object and nested Settings objects associated to that Realm.

```ruby
request = Unimatrix::Regent::Operation.new(
  '/realms/8ca59e2e39f5370e8db640546dbff413',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
).include( :settings )

response = request.query
```

__Response format with settings__

```ruby
[#<Unimatrix::Regent::Realm:0x007fa0a4c7a000
  @_settings=
   [#<Unimatrix::Regent::Setting:0x007fa0a4c82e80
     @content="false",
     @created_at="2016-12-04T21:32:24.188Z",
     @id=48,
     @name="com.boxxspring.embed.enabled",
     @realm_uuid="8ca59e2e39f5370e8db640546dbff413",
     @type_name="setting",
     @updated_at="2016-12-04T21:32:24.188Z">,
    #<Unimatrix::Regent::Setting:0x007fa0a4c824d0
     @content="video_artifact",
     @created_at="2016-12-04T21:32:28.439Z",
     @id=96,
     @name="com.boxxspring.video.type_names",
     @realm_uuid="8ca59e2e39f5370e8db640546dbff413",
     @type_name="setting",
     @updated_at="2016-12-04T21:32:28.439Z">],
  @code_name="boxxspring-documentation-library",
  @created_at="2016-12-04T20:04:20.774Z",
  @domain_name="nil",
  @id=1,
  @name="Boxxspring Documentation Library",
  @type_name="realm",
  @updated_at="2016-12-04T20:04:20.774Z",
  @uuid="8ca59e2e39f5370e8db640546dbff413">]
```

## Error Format

```json
[#<Unimatrix::Regent::Error:0x007fba49bd2080 @message="The requested policies could not be retrieved.", @type_name="forbidden_error">]
```