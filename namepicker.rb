require 'rubygems'
require 'sinatra'

get '/' do
  names = File.read('./names.txt').strip.split(/\r|\n/)
  haml <<-EOS
%html
  %body
    %strong OMG THE WINNER IS...
    %h1 #{names[rand(names.length)].upcase} OMG!
  EOS
end
