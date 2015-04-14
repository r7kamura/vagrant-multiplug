module VagrantPlugins
  module Multiplug
    module Action
      class InstallPlugins
        def initialize(app, *)
          @app = app
        end

        def call(env)
          restart if env[:machine].config.plugin.dependencies.any? do |dependency|
            case
            when dependency.installed?
              false
            when system("vagrant plugin install #{dependency.name} #{dependency.options}")
              true
            else
              exit(1)
            end
          end
          @app.call(env)
        end

        private

        def restart
          exec "#{$0} #{ARGV * ' '}"
        end
      end
    end
  end
end
