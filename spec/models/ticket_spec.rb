require 'spec_helper'

describe Ticket do
  it { should belong_to :fundraiser }
end
