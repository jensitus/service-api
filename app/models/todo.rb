class Todo < ApplicationRecord

  # model association
  has_many :items, dependent: :destroy
  has_and_belongs_to_many :users

  # validations
  validates_presence_of :title, :created_by

end
