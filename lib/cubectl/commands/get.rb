require_relative './base'

module Cubectl
  module Commands
    class Get < Base
      class_option :namespace, aliases: '-n', type: :string, required: false, desc: "Kubernetes namespace", default: 'default'

      desc "pods [--namespace NAMESPACE]", "Get pods from NAMESPACE defaults to `default` namespace"
      def pods
        namespace = options[:namespace]
        fetched_pods = core_client.get_pods(namespace: namespace)
        if fetched_pods.length > 0
          result = "NAME\n" + fetched_pods.map do |p|
            "#{p.metadata.name}"
          end.join("\n")
          say_success(result)
        else
          say_warning("No resources found in #{namespace} namespace")
        end
      end

      desc "services [--namespace NAMESPACE]", "Get jobs from NAMESPACE defaults to `default` namespace"
      def services
        namespace = options[:namespace]
        fetched_services = core_client.get_services(namespace: namespace)
        if fetched_services.length > 0
          result = "NAME\n" + fetched_services.map do |s|
            "#{s.metadata.name}"
          end.join("\n")
          say_success(result)
        else
          say_warning("No resources found in #{namespace} namespace")
        end
      end

      desc "deployments [--namespace NAMESPACE]", "Get deployments from NAMESPACE defaults to `default` namespace"
      def deployments
        namespace = options[:namespace]
        fetched_deployments = apps_client.get_deployments(namespace: namespace)
        if fetched_deployments.length > 0
          result = "NAME\n" + fetched_deployments.map do |d|
            "#{d.metadata.name}"
          end.join("\n")
          say_success(result)
        else
          say_warning("No resources found in #{namespace} namespace")
        end
      rescue StandardError => e
        say_error("Got an error: #{e.message}")
      end
    end
  end
end
