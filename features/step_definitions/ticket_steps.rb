Given /^that fundraiser has the following tickets:$/ do |table|
  flunk 'boo!' unless Fundraiser.count == 1
  Fundraiser.first.update_attribute :tickets, table.hashes.map {|r| Ticket.new r }
end
