#
# Created by JetBrains RubyMine.
# User: Simar Singh
# Date: 6/17/12
# Time: 2:32 AM
#

class JustDialTarget < Target
  after_validation :build_locations_script

  def build_locations_script
      self.location = create_script(url,num_of_pages.to_i);
  end

  def create_script(url,num_of_pages)
       sites = []
          x = url;
          (1..num_of_pages).each do |i|
          sites << x + i.to_s
          end
      sites.to_s;
  end

end

