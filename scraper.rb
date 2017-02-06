#!/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'everypolitician'
require 'pry'
require 'scraperwiki'

require_relative 'lib/politician'

house = EveryPolitician::Index.new.country('Germany').lower_house
house.popolo.persons.map(&:wikidata).compact.each_slice(100) do |wanted|
  data = Wikisnakker::Politician.find(wanted).flat_map(&:positions).compact
  ScraperWiki.save_sqlite(%i(id position start_date), data)
end
