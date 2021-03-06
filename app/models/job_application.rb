class JobApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  validates :user_id, presence: true
  validates :status, presence: true

  enum status: %w(received processing processed )

  default_scope { order(created_at: :desc)}

  def self.number_currently_received
    received.count
  end

  def self.number_currently_processing
    processing.count
  end

  def self.number_currently_processed
    processed.count
  end

  def date_applied(order_created_at)
    application_created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def date_created
    created_at.strftime(" %d %b %Y %l:%M %p")
  end

  def date_updated
    updated_at.strftime(" %d %b %Y %l:%M %p")
  end

  def show_status
    if status == "received"
      status
    else
      "#{status} -  updated on: #{self.updated_at.strftime("%A, %d %b %Y %l:%M %p")}"
    end
  end
end
