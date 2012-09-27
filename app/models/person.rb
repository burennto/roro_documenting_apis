class Person < ActiveRecord::Base

  attr_accessible :name, :occupation, :fictional

  # === Associations ==================================================

  has_many :quotations

  # === Validations ===================================================

  validates :name, :presence   => true,
                   :uniqueness => { :case_sensitive => false }

end
