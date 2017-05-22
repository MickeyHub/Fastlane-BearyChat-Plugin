module Fastlane
  module Actions
    class BearychatAction < Action
      def self.run(params)
        require 'json'

        uri = URI.parse(params[:webhook])

        postParams = {
            "text"        => params[:text],
            "markdown"    => params[:markdown],
            "channel"     => params[:channel],
            "attachments" => params[:attachments]
        }

        request              = Net::HTTP::Post.new(uri)
        request.body         = postParams.to_json
        request.content_type = 'application/json'

        res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') { |http|
          http.request(request)
        }

        puts res
      end

      def self.description
        %q{make bearychat incomming bot into fastlane}
      end

      def self.authors
        [%q{MickeySha}]
      end

      def self.available_options
        FastlaneCore::CommanderGenerator.new.generate(
            [
                FastlaneCore::ConfigItem.new(key:         :webhook,
                                             env_name:    "BEARYCHAT_WEBHOOK",
                                             description: "A description of your option",
                                             is_string:   true,
                                             optional:    false),
                FastlaneCore::ConfigItem.new(key:         :text,
                                             env_name:    "BEARYCHAT_TEXT",
                                             description: "A description of your option",
                                             is_string:   true,
                                             optional:    false),
                FastlaneCore::ConfigItem.new(key:         :notification,
                                             env_name:    "BEARYCHAT_NOTIFICATION",
                                             description: "A description of your option",
                                             is_string:   false,
                                             optional:    true),
                FastlaneCore::ConfigItem.new(key:         :markdown,
                                             env_name:    "BEARYCHAT_MARKDOWN",
                                             description: "A description of your option",
                                             is_string:   false,
                                             optional:    true),
                FastlaneCore::ConfigItem.new(key:         :channel,
                                             env_name:    "BEARYCHAT_CHANNEL",
                                             description: "A description of your option",
                                             is_string:   true,
                                             optional:    true),
                FastlaneCore::ConfigItem.new(key:         :user,
                                             env_name:    "BEARYCHAT_USER",
                                             description: "A description of your option",
                                             is_string:   true,
                                             optional:    true),
                FastlaneCore::ConfigItem.new(key:         :attachments,
                                             env_name:    "BEARYCHAT_ATTACHMENTS",
                                             description: "A description of your option",
                                             is_string:   false,
                                             optional:    true)
            ])
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
