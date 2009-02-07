require 'rubygems'
require 'sinatra'

module NameAndStuff
  def self.name
    names = File.read('./names.txt').strip.split(/\r|\n/)
    names[rand(names.length)].upcase
  end
  
  def self.stuff
    stuff = ["WTF?!", "ALL THE FUCKING TIME!", "FTW!", "OMG!", "LOL!",
             "ROTFLMAOASDF!!", "IN BED!", "GTFO!",
             "<small>secret python programmer irrc</small>"]
    stuff[rand(stuff.length)]
  end
end

get '/' do
  @name_and_stuff = NameAndStuff.name + "... " + NameAndStuff.stuff
  haml :index
end

__END__

@@index
%html
  %body
    %center
      %h2 and the winner is:
      %h1= @name_and_stuff