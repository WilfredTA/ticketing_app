class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags
  validates :name, :body, :status, :project, presence: true

  scope :open, -> { where("tickets.status_id != ?", "4") }

end
