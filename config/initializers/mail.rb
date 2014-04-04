# -*- encoding : utf-8 -*-
config_dir = File.join Rails.root, 'config'
MAIL = YAML.load_file(File.join(config_dir, 'mail.yml'))[Rails.env]
