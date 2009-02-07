require 'rubygems'
require 'sinatra'

get '/' do
  if session[:names].nil? || session[:names].empty?
    session[:names] = File.read('./names.txt').strip.split(/\r|\n/)
  end
  
  if session[:stuff].nil? || session[:stuff].empty?
    session[:stuff] = ["WTF?!", "ALL THE FUCKING TIME!", "FTW!", "OMG!",
                       "ROTFLMAOASDF!!", "IN BED!", "now GTFO!",
                       "<small>secret python programmer iirc</small>"]
  end
  
  @name = session[:names][rand(session[:names].length)]
  @stuff = session[:stuff][rand(session[:stuff].length)]
  
  session[:names].delete(@name)
  session[:stuff].delete(@stuff)

  haml :index
end

__END__

@@index
%html
  %body{ :style => "background-color: yellow" }
    %center
      %h2 and the winner is:
      %h1
        %marquee{ :width => "50%" }= @name + "... " + @stuff
