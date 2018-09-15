class Event < ApplicationRecord
  default_scope { order(starts_at: :desc) }

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
end
