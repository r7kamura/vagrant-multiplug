Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.plugin.add_dependency "vagrant-serverkit", "0.0.2"
  config.plugin.add_dependency "serverkit-rbenv", "0.0.3"

  config.vm.provision :serverkit do |serverkit_config|
    serverkit_config.recipe_path = "recipe.yml"
  end
end
