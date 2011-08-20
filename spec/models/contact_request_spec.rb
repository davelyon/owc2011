require 'spec_helper'

describe ContactRequest do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :email }
end
