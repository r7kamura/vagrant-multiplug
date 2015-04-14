require "vagrant"

module VagrantPlugins
  module Multiplug
    class Plugin < Vagrant.plugin("2")
      name "multiplug"

      config(:plugin) do
        require_relative "config"
        Config
      end

      action_hook(:install_plugins, Plugin::ALL_ACTIONS) do |hook|
        require_relative "action/install_plugins"
        hook.before(
          Vagrant::Action::Builtin::ConfigValidate,
          VagrantPlugins::Multiplug::Action::InstallPlugins,
        )
      end
    end
  end
end
