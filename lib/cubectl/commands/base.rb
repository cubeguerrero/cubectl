require 'thor'
require 'kubeclient'

module Cubectl
  module Commands
    class Base < Thor

      protected

      def apps_client
        kube_client('/apis/apps')
      end

      def core_client
        kube_client('')
      end

      def kube_client(api_group)
        config = Kubeclient::Config.read(File.expand_path '~/.kube/config')
        client = Kubeclient::Client.new(
          config.context.api_endpoint + api_group,
          'v1',
          ssl_options: config.context.ssl_options,
          auth_options: config.context.auth_options
        )
        client.discover
        client
      rescue StandardError => e
        say_error("Experienced an error: #{e}")
      end

      def say_success(message)
        say message, :green
      end

      def say_error(message)
        say message, :red
      end

      def say_warning(message)
        say message, :yellow
      end

      def verbose?
        options[:verbose]
      end
    end
  end
end
