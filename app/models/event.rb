class Event < ApplicationRecord
  default_scope { order(start_at: :desc) }

  def self.get_events(when_params)
    case when_params
    when 'past'
      where(arel_table[:start_at].lt(Date.today))
    when 'future'
      where(arel_table[:start_at].gt(Date.today)).reverse
    else
      all
    end
  end
end
