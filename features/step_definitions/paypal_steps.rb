Then /^I should see a PayPal button$/ do
  page.should have_xpath "//form[contains(@action, 'paypal.com')]"
end

Then /^the PayPal button should set the return to the successful donation page$/ do
  # <INPUT TYPE="hidden" NAME="return" value="URLspecificToThisTransaction">

  page.should have_css "input[type='hidden'][name='return'][value='#{successful_donations_url(:custom => Ticket.last)}']"
end

Then /^the PayPal button should set the return to the successful donation page for those tickets$/ do
  Ticket.all.each do |ticket|
    page.should have_css "input[type='hidden'][name='return'][value='#{successful_donations_url(:custom => ticket.id)}']"
  end
end