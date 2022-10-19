class List < ApplicationRecord
  has_many :tasks
  validates :name, presence: true

  def created_on
    self.created_at.localtime.strftime("Created on %m/%d/%Y at %I:%M %p")
  end

end
