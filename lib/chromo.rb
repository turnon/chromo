# frozen_string_literal: true

require_relative "chromo/version"
require 'mongoid'
require 'chromo/item'

module Chromo

  class << self
    def load(dir)
      ENV['MONGOID_ENV'] ||= 'development'
      config_file = File.join(dir, 'mongoid.yml')
      Mongoid.load!(config_file)
    end
  end

end
