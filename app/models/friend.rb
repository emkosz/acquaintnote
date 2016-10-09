class Friend < ActiveRecord::Base
  validates :first_name, presence: true
  belongs_to :user
end
