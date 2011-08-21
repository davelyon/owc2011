require 'spec_helper'
describe NewsletterSubscription do
  describe '::create' do
    let(:email) {'kidshavehope@mailinator.com'}
    let(:response) { double HTTParty::Response, code: code }
    subject { NewsletterSubscription.create email }
    before { NewsletterSubscription.stub post: response }
    context 'success' do
      let(:code) { 201 }
      it { should eq 201 }
    end
    context 'failure' do
      let(:code) { 409 }
      it {should eq 409 }
    end
  end
end
