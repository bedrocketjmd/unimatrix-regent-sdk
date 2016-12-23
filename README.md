# Unimatrix Regent SDK

## Installation
Add this line to your applications Gemfile:

```ruby
gem 'unimatrix-regent-sdk'
```

And then execute:

	$ bundle
	
	
## How to use

* The Regent SDK requires the following environment variable:

```
REGENT_URL=https://regent.boxxspring.com
```

### Email Settings Request
Returns email specific settings for a given authentication realm.  The return is an array of hashes, each hash being one setting containing the `name` and `content`:

```ruby
[
  { "name": "first_setting_name", "content": "first_setting_content" },
  { "name": "second_setting_name", "content": "second_setting_content" }
]
```

__Required Parameters__

* Keymaker/Regent specific `realm_uuid` (NOTE: this is *different* than the `realm_uuid` found in Archivist)
* An `access_token` that resolves to a `resource_owner` with a policy for the given allowing `read` action for the `Realms` resource (NOTE: Tokens can be retrieved using the [unimatrix-keymaker-sdk](https://github.com/bedrocketjmd/unimatrix-keymaker-sdk))

```ruby
realm_uuid     = 'a4b3e1f96e997ffa909571f41b92cd1b'
access_token   = '14c4eacb5edfaacbe9e112aba30add60'

email_settings = Unimatrix::RegentSDK::EmailSettingsRequest.new(
  realm_uuid,
  access_token
).retrieve
```
