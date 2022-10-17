class List < ApplicationRecord

  def created_at_local
    self.created_at.localtime.strftime("Created on %m/%d/%Y at %I:%M %p")
  end
  
end
