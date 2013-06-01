require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

class BigApp < Sinatra::Application

  configure do
    set :root, File.dirname(__FILE__)
    set :public_folder, Proc.new { File.join(root, "public") }
    set :public_folder, 'public'
  end

  get '/' do
    erb :index
  end

  get "/stylesheet.css" do
    erb :styles, :layout => false
  end

  get '/socket' do
    erb :socket
  end

  get '/map' do
    erb :map
  end

  get '/scraper' do
    erb :scraper
  end
end
