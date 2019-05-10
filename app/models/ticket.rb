class Ticket < ApplicationRecord
#defaults
    enum status: [ :active, :inactive, :potential, :resolved ]
    enum severity: [ :P1, :P2, :P3, :P4]
    paginates_per 10  
#Relationships  
    belongs_to :client
    belongs_to :user
  
#validations
    validates :ticket_number, presence: true, allow_nil: true
    validates :request_detail, presence: true
    validates :request_summary, presence: true
    validates :severity, presence: true
    validates :status, presence: true
    
#Scopes
    scope :active, -> { where(status: "active") }
    
#Methods
    def assign_ticket_number
        self.update_column(:ticket_number, "Ticket-#{self.id}")
    end
    
    def days_pending
        return "1"
    end
#Callbacks
    after_save :assign_ticket_number
end
