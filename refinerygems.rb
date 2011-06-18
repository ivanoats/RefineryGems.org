require 'rubygems'
require 'sinatra'
require 'httparty'

class RefineryGem
  include HTTParty
end

get '/' do
  response = "<!DOCTYPE html>"
  response << "<head><title>Refinery Gems</title></head><body>"
  response << "<h1>RefineryGems</h1>\n"
  response << "<ul>"
  # call rubygems.org api
  # http://rubygems.org/api/v1/search.json?query=refinerycms
  # Loop through and print out names of gems and links to their homepage
  RefineryGem.get('http://rubygems.org/api/v1/search.json?query=refinerycms').each do |g|
    response << "<li><a href=\"#{g['homepage_uri']}\">" + "#{g['name']}" + "</a>"
  end
  response << "</ul></body></html>"
end