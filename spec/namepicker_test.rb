require 'rubygems'
require 'sinatra'
require 'sinatra/test/rspec'
require File.dirname(__FILE__) + '/../namepicker.rb'

module NamepickerTestHelper
  def array_to_regex(array)
    Regexp.new(array.map { |i| Regexp.escape(i) }.join('|'))
  end
end

describe "namepicker's one and only page" do
  include NamepickerTestHelper
  
  before(:all) do
    path = File.dirname(__FILE__)
    @names = File.read(path + '/../data/names.txt').strip.split(/\n|\r/)
    @zingers = File.read(path + '/../data/zingers.txt').strip.split(/\n|\r/)
    get '/'
  end
  
  it "should be successful" do
    @response.should be_ok
  end
  
  it "should show a name from the names data file" do
    @response.body.should =~ array_to_regex(@names)
  end

  it "should show a zinger from the zingers data file" do
    @response.body.should =~ array_to_regex(@zingers)
  end
end

# TODO: integration test that multiple requests don't repeat names or zingers.
