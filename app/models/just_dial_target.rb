#
# Created by JetBrains RubyMine.
# User: Simar Singh
# Date: 6/17/12
# Time: 2:32 AM
#

class JustDialTarget < Target
  after_validation :build_locations_script
  def build_locations_script

  self.location =
      " sites = []
          x = '#{self.url}/page-'
          (1..#{self.num_of_pages.to_s}).each do |i|
          sites << x + i.to_s
        end
      sites"
  end

end

