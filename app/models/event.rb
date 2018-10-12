class Event < ApplicationRecord
  default_scope { order(starts_at: :desc) }

  belongs_to :venue, optional: true

  has_many :sessions
  has_and_belongs_to_many :communities
  has_many :attendees
  has_many :users, through: :attendees

  scope :undecided_dates, -> { where(starts_at: nil) }
  scope :past, -> { where(arel_table[:starts_at].lt(Date.today)) }
  scope :future, -> { 
    where(arel_table[:starts_at].gt(Date.today))
    .or(undecided_dates)
    .reverse
  }

  def self.get_events(when_params)
    case when_params
    when 'past'
      past
    when 'future'
      future
    else
      all
    end
  end

  def sessions_with_user
    sessions.includes(:user)
  end

end
