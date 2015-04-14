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

      # @note ::Vagrant.has_plugin?(@name, @version) cannot be used because it looks up from caches
      def installed?
        `vagrant plugin list`.each_line.any? do |line|
          if @version
            line == "#{@name} (#{@version})\n"
          else
            line.start_with?("#{@name} (")
          end
        end
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
