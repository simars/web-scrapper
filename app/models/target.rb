#
#
# User: Simar Paul Singh
# Date: 5/20/12
# Time: 3:22 PM
#

require 'just_dial_scrapper'

class Target < ActiveRecord::Base
  has_many :items, :as => :container
  before_save :build_contained_items

  include JustDialScrapper

  def build_contained_items
    @locations = location_proc.call(self) if location_proc
    @locations = eval "[#{location}]" unless @locations || @locations.kind_of?(Array)
    puts @locations
    @locations.each do |loc|
      item_collection = script_proc.call(loc) if script_proc
      item_collection = getItems(loc) unless item_collection || item_collection.kind_of?(Array)
      item_collection.each { |item|  items <<  item } if item_collection
    end
  end

  def location_proc
     @location_proc ||= eval_safely("Proc.new { #{location} }") unless location.blank?
     @location_proc
   end

   def script_proc
     @script_proc ||= self.eval_safely("Proc.new { #{script} }") unless script.blank?
     @script_proc
   end

   def eval_safely(code)
     return eval code unless  code.blank?
     rescue Exception=> e
       puts e
   end

  end