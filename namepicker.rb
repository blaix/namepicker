require 'rubygems'
require 'sinatra'

get '/' do
  names = File.read('./names.txt').strip.split(/\r|\n/)
  name = names[rand(names.length)].upcase
  haml <<-EOS
%html
  %body
    %strong OMG THE WINNER IS...
    %h1 #{name} OMG!
  EOS
end
