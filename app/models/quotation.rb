class Quotation < ActiveRecord::Base

  attr_accessible :quote, :description

  # === Associations ==================================================

  belongs_to :person, :validate => true

  # === Validations ===================================================

  validates :quote, :presence   => true,
                    :uniqueness => { :case_sensitive => false, :scope => :person_id }

end
