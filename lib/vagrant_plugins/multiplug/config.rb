require "vagrant"

module VagrantPlugins
  module Multiplug
    class Config < Vagrant.plugin("2", :config)
      def add_dependency(name, version = nil)
        dependencies << Dependency.new(name, version)
      end

      def dependencies
        @dependencies ||= []
      end
    end

    class Dependency
      attr_reader :name, :version

      def initialize(name, version = nil)
        @name = name
        @version = version
      end

      def installed?
        ::Vagrant.has_plugin?(@name, @version)
      end

      # @return [String] Command-line options for `vagrant plugin install NAME`
      def options
        if @version
          "--plugin-version #{@version}"
        end
      end
    end
  end
end
