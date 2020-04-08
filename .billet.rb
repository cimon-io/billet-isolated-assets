repo_root = 'https://raw.githubusercontent.com/cimon-io/billet-isolated-assets/master'
assets_root_folder = 'assets'

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
