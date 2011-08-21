class NewsletterSubscription
 include HTTParty
  format :xml
  headers 'Accept'        => 'application/atom+xml'
  headers 'Content-Type'  => 'application/atom+xml'

  class << self
    
    def user
      ENV['CC_USER']
    end

    def setup
      key, pass = ENV.values_at 'CC_KEY', 'CC_PASS'
      basic_auth "#{key}%#{user}", pass
      base_uri "https://api.constantcontact.com/ws/customers/#{user}"
    end

    def contact_list_id
      "http://api.constantcontact.com/ws/customers/#{user}/lists/4"
    end

    def create email
      setup
      body = <<-XML
        <entry xmlns="http://www.w3.org/2005/Atom">
          <title type="text"> </title>
          <updated>#{Time.now.iso8601}</updated>
          <author></author>
          <id>data:,none</id>
          <summary type="text">Contact</summary>
          <content type="application/vnd.ctct+xml">
            <Contact xmlns="http://ws.constantcontact.com/ns/1.0/">
              <EmailAddress>#{email}</EmailAddress>
              <OptInSource>ACTION_BY_CONTACT</OptInSource>
              <ContactLists>
                <ContactList id="#{contact_list_id}" />
              </ContactLists>
            </Contact>
          </content>
        </entry>
      XML
      response = post "/contacts", body: body
      response.code
    end
  end
end
