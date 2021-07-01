# Load the Rails application.
require_relative "application"

# Load environmental variables
env_file = Rails.root.join('config', "#{Rails.env}_env.yml")
if File.exist?(env_file)
  YAML.safe_load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] ||= value.to_s
  end
end

# Initialize the Rails application.
Rails.application.initialize!
