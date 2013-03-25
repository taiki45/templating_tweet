# -*- coding: utf-8 -*-
require 'yaml'
require 'mustache'

module Templating
  class Template < Mustache
    def initialize(config)
      @env = config
    end

    def method_missing(name, *args)
      if @env.has_key? name.to_s
        @env[name.to_s]
      else
        super
      end
    end

    def respond_to_missing?(name, include_private)
      @env.has_key?(name.to_s) || super
    end
  end

  Plugin.create :templating_tweet do
    path = File.exist?(File.expand_path('../config.yaml', __FILE__)) ? 'config.yaml' : 'sample.yaml'
    config = YAML.load_file(File.expand_path("../#{path}", __FILE__))
    template = Template.new(config)

    filter_gui_postbox_post do |box|
      buff = ::Plugin.create(:gtk).widgetof(box).widget_post.buffer
      template.template = buff.text
      buff.text = template.render
      [box]
    end
  end
end
