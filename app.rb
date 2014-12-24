#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'open-uri'

BASE_URL    = 'http://www.sql-tutorial.ru/ru'.freeze
CONTENT_URL = "#{BASE_URL}/content.html".freeze

page = Nokogiri::HTML(open(CONTENT_URL))
divs = page.css('ul.chapters li > div')

divs.each do |div|
  hrefs = div.css('a.chapters').map do |a|
    a['href'] if a['href'].match('/ru/')
  end

  hrefs.each do |href|
    # TODO: generate the list of links with absolute path for now
    p href
  end
end
