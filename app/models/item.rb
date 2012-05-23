#
#
# User: Simar Paul Singh
# Date: 5/20/12
# Time: 3:22 PM
#
class Item < ActiveRecord::Base
  belongs_to :container, :polymorphic => true, :dependent => :destroy
end
