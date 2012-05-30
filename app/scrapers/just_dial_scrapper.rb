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
    doc.css('.Ctitle > a').each do |element|
      begin
        item = Item.new
        item.source=location
        item.link = element.attributes['href'].value rescue "error"
        item.link = item.link.gsub!('<','3C').gsub('>','3E')
        item.name = element.text;
        itemDoc = Nokogiri::HTML(open(item.link))
        if item.link
          item.contact = itemDoc.at_css('.contName + span').text rescue "error"
          item.phone =  itemDoc.at_css('.contPhone + span').text rescue "error"
          item.address = itemDoc.at_css('.contAdd + span').gsub!('View Map | Locate on Map','').text rescue "error"
        end
        if block_given?
          item = yield item
        end
        item_collection << item
      rescue exception => e
        puts e
      end
    end
    item_collection
  end
end