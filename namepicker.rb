require 'rubygems'
require 'sinatra'

enable :sessions

configure do
  set :data,  File.dirname(__FILE__) + '/data'
  set :views, File.dirname(__FILE__) + '/views'
end

helpers do
  def get_lines_and_randomize(path_to_file)
    File.read(path_to_file).strip.split(/\r|\n/).sort_by { rand }
  end
end

before do
  %w(names zingers).each do |type|
    session[type] ||= []
    if session[type].empty?
      session[type] = get_lines_and_randomize(options.data + "/#{type}.txt")
    end
  end
end

get '/' do
  @name = session['names'].pop
  @zinger = session['zingers'].pop  
  haml :index
end
