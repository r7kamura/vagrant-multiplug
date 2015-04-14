# vagrant-multiplug
[Vagrant](https://github.com/mitchellh/vagrant) plug-in to manage plug-in dependencies.

## Usage
This plug-in will automatically install dependent plug-in before running vagrant actions.

```
$ vagrant plugin install vagrant-multiplug
```

After installing, you can specify the required plug-in dependencies in your Vagrantfile like so:

```rb
# Vagrantfile
Vagrant.configure("2") do |config|
  config.plugin.add_dependency "vagrant-serverkit", "0.0.2"
  config.plugin.add_dependency "serverkit-defaults"
  config.plugin.add_dependency "serverkit-homebrew"
  config.plugin.add_dependency "serverkit-karabiner"
  config.plugin.add_dependency "serverkit-rbenv"
  ...
end
```
