class ContactRequest < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :email

  def options
    [
      ["Parent Workshops", "Parent Workshops"],
      ["Teacher in service", "Teacher in service"],
      ["In class student sessions", "In class student sessions"],
      ["General question","General question"]
    ]
  end

end
