require 'rails_helper'

describe Job do

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:posting_cost)}


end
