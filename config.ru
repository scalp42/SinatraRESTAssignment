require 'rubygems'
require 'bundler'

Bundler.require

root = File.dirname(__FILE__)
require File.join(root, 'application')
run Application