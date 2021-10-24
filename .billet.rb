repo_root = 'https://raw.githubusercontent.com/cimon-io/billet-isolated-assets/master'
assets_root_folder = 'assets'
initializers_folder = File.exist?('config/initializers/monkeypatches') ? 'config/initializers/monkeypatches' : 'config/initializers'

append_to_file '.gitignore' do <<~TEXT

  # Ignore assets generated files
  /assets/yarn-debug.log*
  /assets/.yarn-integrity
  /assets/node_modules
  /assets/yarn-error.log
  /assets/yarn-debug.log*
  /assets/.yarn-integrity
TEXT
end

inside assets_root_folder do
  open("#{repo_root}/.allfiles").read.split("\n").each do |filename|
    get "#{repo_root}/#{filename}", filename
  end
end

inside bin_folder do
  get "#{repo_root}/bin_assets.sh", 'assets'
end

inside initializers_folder do
  get "#{repo_root}/action_view_assets_url_helper.rb", 'action_view_assets_url_helper.rb'
end

append_to_file 'env.sample', 'WEB_ASSETS_DIR=web-assets' if File.exist?('env.sample')
append_to_file 'Procfile', 'assets: bin/assets' if File.exist?('env.sample')
