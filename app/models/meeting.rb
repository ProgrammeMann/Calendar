class Meeting < ApplicationRecord
	serialize :recurring, Hash
	belongs_to :user


  

  def recurring=(value) 
  	if value == "null"
      super(nil)
    elsif RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash) 
    else
      super(nil)
    end
  end

  def rule
    IceCube::Rule.from_hash recurring
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  def calendar_meetings(start)
    if recurring.empty?
      [self]	
    else
      start_date = start.beginning_of_month.beginning_of_week
      end_date = start.end_of_month.end_of_week
      schedule(start_time).occurrences(end_date).map do |date|
        Meeting.new(id: id, name: name, description: description, user_id: user_id, start_time: date)
      end
    end
end
end
