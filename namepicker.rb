require 'rubygems'
require 'sinatra'

enable :sessions

helpers do
  def get_lines_and_randomize(path_to_file)
    File.read(path_to_file).strip.split(/\r|\n/).sort_by { rand }
  end
end

before do
  session[:names] ||= []
  session[:zingers] ||= []
  
  if session[:names].empty?
    session[:names] = get_lines_and_randomize('./data/names.txt')
  end
  
  if session[:zingers].empty?
    session[:zingers] = get_lines_and_randomize('./data/zingers.txt')
  end
end

get '/' do
  @name = session[:names].pop
  @zinger = session[:zingers].pop  
  haml :index
end

__END__

@@index
%html
  %body{ :style => "background-color: yellow" }
    %center
      %h2 and the winner is:
      %h1
        %marquee{ :width => "75%" }
          %img{ :src => "images/gator_walking.gif" }
          = @name + "... "
          %small= @zinger
          %img{ :src => "images/gator_laying.gif" }
