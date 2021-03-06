class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :creator, foreign_key: 'creator', class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags
  validates :name, :body, :status, :project, presence: true

  scope :open, -> { where("tickets.status_id != ?", "4") }

end
