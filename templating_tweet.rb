# -*- coding: utf-8 -*-
require 'pry'
require 'yaml'
require 'mikutter_plugin_base'

class Env
  def initialize(config)
    @env = config
  end

  def bind
    binding
  end

  def method_missing(name, *args)
    if @env.has_key? name.to_s
      @env[name.to_s]
    else
      super
    end
  end
end

class Templating < Mikutter::PluginBase
  def run(plugin)
    path = File.exist?(File.expand_path('../config.yaml', __FILE__)) ? 'config.yaml' : 'sample.yaml'
    @env = Env.new YAML.load(open(File.expand_path("../#{path}", __FILE__)))
  end

  def filter_gui_postbox_post(box)
    buff = Plugin.create(:gtk).widgetof(box).widget_post.buffer
    buff.text = ERB.new(buff.text).result(@env.bind)
    [box]
  end
end

Templating.register!
