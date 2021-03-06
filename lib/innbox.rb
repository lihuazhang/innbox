require "innbox/model"
require "innbox/engine"
require "innbox/configuration"
require "innbox/version"
require 'will_paginate'
require 'will_paginate/active_record'

module Innbox
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.per_page = 32
      @config.user_class = 'User'
      @config.user_name_method = 'name'
      @config.user_avatar_url_method = nil
      @config.user_profile_url_method = 'profile_url'
      @config.authenticate_user_method = 'authenticate_user!'
      @config.current_user_method = 'current_user'
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end
