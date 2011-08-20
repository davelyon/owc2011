# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


if Admin.find_by_email("admin@kidshavehope.org").blank?
  Admin.create!(
    :email => "admin@kidshavehope.org",
    :password => "password",
    :password_confirmation => "password")
end
