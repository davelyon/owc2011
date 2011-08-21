module DonationsHelper
  def paypal_button(options={})
    amount = "%.2f" % options[:amount] if options[:amount]
    name = options[:name] || 'Donation'
    html = <<-HTML
      <form alt="PayPal Donate" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank" class ="paypal">
        <input type="hidden" value="_donations" name="cmd">
        <input type="hidden" value="melicurk@kidshavehope.org" name="business">
        <input type="hidden" value="#{name}" name="item_name">
        <input type="hidden" value="09112010" name="item_number">
        <input type="hidden" value="#{amount}" name="amount">
        <input type="hidden" value="USD" name="currency_code">
        <input type="hidden" value="" name="image_url">
        <input type="hidden" value="0" name="no_note">
        <input type="hidden" value="Message to Seller" name="cn">
        <input type="hidden" value="" name="return">
        <input type="hidden" value="" name="cancel_return">
        <input type="hidden" value="yahoo-sitesolution" name="bn">
        <input type="hidden" value="C3MGKKUCCAB9J" name="pal">
        <input type="hidden" value="R-5AJ59462NH120001H" name="mrb">
        <input type="hidden" value="#{successful_donations_url}" name="return">
        <input type="image" alt="PayPal Donate" src="http://us.i1.yimg.com/us.yimg.com/i/us/smallbiz/gr/paypal_x_click_but04_enabled.gif">
      </form>
    HTML
    html.html_safe
  end
end
