class Task < ApplicationRecord
  belongs_to :list

  def created_on
    self.created_at.localtime.strftime("Created on %m/%d/%Y at %I:%M %p")
  end

end
