require 'spec_helper'

describe Quotation do

  it { should belong_to(:person).validate }

  it { should validate_presence_of(:quote) }
  it { should validate_uniqueness_of(:quote).scoped_to(:person_id).case_insensitive }

end
