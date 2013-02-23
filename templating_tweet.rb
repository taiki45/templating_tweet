# -*- coding: utf-8 -*-
require 'pry'
require 'yaml'
require 'mikutter_plugin_base'

class Env
  def initialize(cofig)
    @env = cofig
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
    #path = File.exist?(File.expand_path('../config.yaml', __FILE__)) ? 'config.yaml' : 'sample.yaml'
    #env = Env.new YAML.load(open(File.expand_path("../#{path}", __FILE__)))
    #@binding = env.__send__ :binding

    plugin.filter_gui_postbox_post do |box|
      buff = Plugin.create(:gtk).widgetof(box).widget_post.buffer

      #case buff.text
      #when /^@null[ \n]+(.+)$/
      buff.text = rand(1000).to_s
      #end
      [box]
    end
  end
end

Templating.register!
