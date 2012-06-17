#
# Created by JetBrains RubyMine.
# User: Simar Singh
# Date: 6/17/12
# Time: 2:32 AM
#

class JustDialTarget < Target
  attr_accessor :url, :start_page, :end_page
  after_validation :build_locations_script
end

def build_locations_script
  @locations =
      " sites = []
          x = '#{url}/page-'
          (#{start_page}..#{end_page}).each do |i|
          sites << x + i.to_s
        end
      sites"
end