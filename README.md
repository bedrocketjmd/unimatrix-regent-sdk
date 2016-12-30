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

### Realms Index Request
Returns the first 10 realms in the databse as well as unlimited count.

__Required Parameters__

* Path: `'/realms'`
* Access token with the correct policy (Resource Server: Regent, Resource: Realms, action: "query")

```ruby
request = Unimatrix::RegentSdk::Request.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
)

response = request.get
```

__Response Format__

```json
{
  "$this": {
    "name": "realms",
    "type_name": "realm",
    "ids": [
      1,
      2,
      3,
    ],
    "unlimited_count": 3,
    "count": 3
  },
  "realms": [
    {
      "uuid": "70eec79c8f5995b4f6f79e055f254e44",
      "type_name": "realm",
      "name": "Boxxspring Documentation Library",
      "code_name": "boxxspring-documentation-library",
      "domain_name": "nil",
      "created_at": "2016-12-04T20:04:20.774Z",
      "updated_at": "2016-12-04T20:04:20.774Z"
    },
    {
      "uuid": "c6b4bb942117d2cc7cf20801e794ac7c",
      "type_name": "realm",
      "name": "Turbine Demo",
      "code_name": "turbine-demo",
      "domain_name": "nil",
      "created_at": "2016-12-04T20:04:20.833Z",
      "updated_at": "2016-12-04T20:04:20.833Z"
    },
    {
      "uuid": "d27f1b8d5b31f159c4fa17db3c1a15e1",
      "type_name": "realm",
      "name": "Roku Network A",
      "code_name": "roku_networka",
      "domain_name": "networka.roku.com",
      "created_at": "2016-12-04T20:04:20.884Z",
      "updated_at": "2016-12-04T20:04:20.884Z"
    }
  ]
}
```
__Offset__

If there are more than 10 results, to receive the next set of results, send an offset parameter along with the access token

```ruby
request = Unimatrix::RegentSdk::Request.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60',
  offset: 10
)

response = request.get
```

__Count__

You can request a specific number of returns by sending a count (max 100)

```ruby
request = Unimatrix::RegentSdk::Request.new(
  '/realms',
  access_token: '14c4eacb5edfaacbe9e112aba30add60',
  count: 25
)

response = request.get
```

### Realm by UUID
Returns information on a specific realm.

__Required Parameters__

* Path including the realm_uuid: `'/realms/d27f1b8d5b31f159c4fa17db3c1a15e1'`
* Access token with the correct policy (Resource Server: Regent, Resource: Realms, action: "read")

```ruby
request = Unimatrix::RegentSdk::Request.new(
  '/realms/d27f1b8d5b31f159c4fa17db3c1a15e1',
  access_token: '14c4eacb5edfaacbe9e112aba30add60'
)

response = request.get
```

__Response Format__

```json
{
  "$this": {
    "name": "realms",
    "type_name": "realm",
    "ids": [
      3
    ]
  },
  "realms": [
    {
      "uuid": "d27f1b8d5b31f159c4fa17db3c1a15e1",
      "type_name": "realm",
      "name": "Roku Network A",
      "code_name": "roku_networka",
      "domain_name": "networka.roku.com",
      "created_at": "2016-12-04T20:04:20.884Z",
      "updated_at": "2016-12-04T20:04:20.884Z"
    }
  ]
}
```
__Include Settings__

```ruby
request = Unimatrix::RegentSdk::Request.new(
  '/realms/d27f1b8d5b31f159c4fa17db3c1a15e1',
  access_token: '14c4eacb5edfaacbe9e112aba30add60',
  include_settings: true
)

response = request.get
```

__Response format with settings__

Returns information on a specific realm including settings.

```json
{
  "$this": {
    "name": "realms",
    "type_name": "realm",
    "ids": [
      3
    ]
  },
  "realms": [
    {
      "uuid": "d27f1b8d5b31f159c4fa17db3c1a15e1",
      "type_name": "realm",
      "name": "Roku Network A",
      "code_name": "roku_networka",
      "domain_name": "networka.roku.com",
      "created_at": "2016-12-04T20:04:20.884Z",
      "updated_at": "2016-12-04T20:04:20.884Z"
    }
  ],
  "settings": [
    {
      "id": 8,
      "type_name": "setting",
      "name": "artifact.type_names",
      "content": "annotation_artifact,article_artifact,attribution_artifact,audio_artifact,author_artifact,form_artifact,group_artifact,headline_artifact,list_article_artifact,media_artifact,page_artifact,picture_artifact,playlist_artifact,post_artifact,reaction_artifact,section_artifact,stream_artifact,tag_artifact,text_artifact,video_artifact,game_artifact,league_artifact,player_artifact,season_artifact,team_artifact",
      "created_at": "2016-12-04T21:32:20.565Z",
      "updated_at": "2016-12-04T21:32:20.565Z",
      "realm_uuid": "7f717472083800ff8a5312f617c9b36e"
    },
    {
      "id": 53,
      "type_name": "setting",
      "name": "com.boxxspring.video.type_names",
      "content": "video_artifact",
      "created_at": "2016-12-04T21:32:24.741Z",
      "updated_at": "2016-12-04T21:32:24.741Z",
      "realm_uuid": "7f717472083800ff8a5312f617c9b36e"
    }
  ],
  "$associations": {
    "realms": [
      {
        "id": 8,
        "settings": {
          "type_name": "setting",
          "ids": [
            8,
            53
          ]
        }
      }
    ]
  }
}

```

__Required Parameters__



### Email Settings Request
This request filters the response to only email settings and returns them with the name expected by email templates currently in Keymaker/Dealer.


__Required Parameters__

* Realm uuid for the email settings desired
* Access token with the correct permissions

```ruby
realm_uuid     = 'a4b3e1f96e997ffa909571f41b92cd1b'
access_token   = '14c4eacb5edfaacbe9e112aba30add60'

email_settings_request = Unimatrix::RegentSDK::EmailSettingsRequest.new(
  realm_uuid,
  access_token
)

email_settings = email_settings_request.retrieve
```

The email settings request returns email specific settings for a given authentication realm.  The return is an array of hashes, each hash being one setting containing the `name` and `content`:

```ruby
[
  { "name": "first_setting_name", "content": "first_setting_content" },
  { "name": "second_setting_name", "content": "second_setting_content" }
]
```

### Error Format

```json
{
  "$this": {
    "name": "errors",
    "type_name": "error",
    "ids": [
      70114393578920
    ]
  },
  "errors": [
    {
      "id": 70114393578920,
      "type_name": "forbidden_error",
      "message": "The requested policies could not be retrieved."
    }
  ]
}
```