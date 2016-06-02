# Fastlane-BearyChat-Plugin

![](https://img.shields.io/badge/_status_-_under--construction_-brightgreen.svg)

### Before README
before readme, you have to read [Bearychat Document](https://bearychat.com/integrations/incoming),
follow the doc, you'll create an incoming bot, and get a webhook url.

### Usage
```ruby
bearychat(
  webhook: 'https://xxxxx',
  text: '',
  notification: '',
  markdown: false,
  channel: '',
  user: '',
  attachments: [
    {
      title: '',
      text: '',
      color: '',
      images:[{'url': 'https://xxxx.jpg'}]
    }
  ]
)
```

### Note
I'll convert it to plugin while fastlane-plugins manager is OK.

### Licence
[MIT License](LICENSE)
