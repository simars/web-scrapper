#
# User: Simar Singh
# Date: 5/ 19/12
# Time : 1 : 50 AM
#
require 'nokogiri'
require 'httparty'
require 'open-uri'

module JustDialScrapper

  def getItems(location)
    JustDialScrapper.getItems(location)
  end

  def self.getItems(location)
    item_collection = []
    doc = Nokogiri::HTML(open(location))
    doc.css('div .logoDesc').each do |element|
      item = Item.new
      item.source=location
      item.contact=  try {element.inner_html.scan(/(\+\(\d+\).*\d+)\</)[0]}
      item.description = try {element.children[0].text}
      item.link = try {element.children[1].attributes['href'].value }
      item.detail = element.inner_html
      if block_given?
        item = yield item
      end
      item_collection << item
    end
    item_collection
  end
end