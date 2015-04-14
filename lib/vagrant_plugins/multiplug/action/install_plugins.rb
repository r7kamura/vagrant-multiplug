module VagrantPlugins
  module Multiplug
    module Action
      class InstallPlugins
        def initialize(app, *)
          @app = app
        end

        def call(env)
          results = env[:machine].config.plugin.dependencies.map do |dependency|
            case
            when dependency.installed?
              false
            when system("vagrant plugin install #{dependency.name} #{dependency.options}")
              true
            else
              exit(1)
            end
          end
          restart if results.any?
          @app.call(env)
        end

        private

        def restart
          puts "Restarting vagrant..."
          exec "#{$0} #{ARGV * ' '}"
        end
      end
    end
  end
end
