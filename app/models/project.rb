class Project < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true
    validates :tools, presence: true
end
