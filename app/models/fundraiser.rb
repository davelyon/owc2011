class Fundraiser < ActiveRecord::Base
  has_event_calendar
  has_many :tickets
end
