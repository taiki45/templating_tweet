# -*- coding: utf-8 -*-
require 'yaml'
require 'mikutter_plugin_base'
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

  class Plugin < Mikutter::PluginBase
    def run(plugin)
      path = File.exist?(File.expand_path('../config.yaml', __FILE__)) ? 'config.yaml' : 'sample.yaml'
      @template = Template.new YAML.load(open(File.expand_path("../#{path}", __FILE__)))
    end

    def filter_gui_postbox_post(box)
      buff = ::Plugin.create(:gtk).widgetof(box).widget_post.buffer
      @template.template = buff.text
      buff.text = @template.render
      [box]
    end
  end
end

Templating::Plugin.register!
