#
# User: Simar Singh
# Date: 5/ 19/12
# Time : 1 : 50 AM
#
require 'nokogiri'
require 'httparty'
require 'open-uri'

module JustDialScrapper

  def getItems(location, target)
    JustDialScrapper.getItems(location, target)
  end

  def self.getItems(location, target)
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
          item.last_name = item.contact = itemDoc.at_css('.contName + span').text rescue "error"
          item.phone =  itemDoc.at_css('.contPhone + span').text rescue "error"
          item.address = itemDoc.at_css('.contAdd + span').text.gsub!('View Map | Locate on Map','') rescue "error"
          item.website = itemDoc.at_css('.contWeb + span').text rescue "error"
          item.detail = itemDoc.at_css('#compdetails').text rescue "error"
          item.description = itemDoc.at_css('#contact').text rescue "error"
          item.lead_status = "New"
        end
        item[:lead_source] = target[:lead_source]
        item[:industry] = target[:industry]
        item[:city] = target[:city]
        item[:state] = target[:state]
        item[:country] = target[:country]
        item[:assigned_to] = target[:assigned_to]
        if block_given?
          item = yield item
        end
        item_collection << item
      rescue Exception => e
        puts e
      end
    end
    item_collection
  end
end