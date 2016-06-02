module Fastlane
  module Actions
    class BearychatAction < Action
      def self.run(params)

        uri = URI.parse(params[:webhook])

        postParams = {
            "text" => params[:text],
            "markdown" => params[:markdown],
            "channel" => params[:channel],
            "attachments" => params[:attachments]
        }
        res = Net::HTTP.post_form(uri, postParams)
        puts res
      end

      def self.description
        %q{make bearychat incomming bot into fastlane}
      end

      def self.authors
        [%q{MickeySha}]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :webhook,
                                  env_name: "BEARYCHAT_WEBHOOK",
                               description: "A description of your option",
                                  optional: false,
                                      type: String)

          FastlaneCore::ConfigItem.new(key: :text,
                                  env_name: "BEARYCHAT_TEXT",
                               description: "A description of your option",
                                  optional: false,
                                      type: String)

          FastlaneCore::ConfigItem.new(key: :notification,
                                  env_name: "BEARYCHAT_NOTIFICATION",
                               description: "A description of your option",
                                  optional: true,
                                      type: String)
          FastlaneCore::ConfigItem.new(key: :markdown,
                                  env_name: "BEARYCHAT_MARKDOWN",
                               description: "A description of your option",
                                  optional: true,
                                      type: Boolean)

          FastlaneCore::ConfigItem.new(key: :channel,
                                  env_name: "BEARYCHAT_CHANNEL",
                               description: "A description of your option",
                                  optional: true,
                                      type: String)

          FastlaneCore::ConfigItem.new(key: :user,
                                  env_name: "BEARYCHAT_USER",
                               description: "A description of your option",
                                  optional: true,
                                      type: String)

          FastlaneCore::ConfigItem.new(key: :attachments,
                                  env_name: "BEARYCHAT_ATTACHMENTS",
                               description: "A description of your option",
                                  optional: true,
                                      type: Hash)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
