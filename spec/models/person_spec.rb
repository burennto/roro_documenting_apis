require 'spec_helper'

describe Person do

  it { should have_many(:quotations) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }

end
