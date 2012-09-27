twain     = Person.create!(:name => 'Mark Twain',        :occupation => 'Author',     :fictional => false)
churchill = Person.create!(:name => 'Winston Churchill', :occupation => 'Politician', :fictional => false)
wayne     = Person.create!(:name => 'Bruce Wayne',       :occupation => 'Batman',     :fictional => true)

twain.quotations.create!(:quote => 'The reports of my death have been greatly exaggerated.')
twain.quotations.create!(:quote => 'Go to Heaven for the climate, Hell for the company.')
twain.quotations.create!(:quote => 'Be careful about reading health books. You may die of a misprint.')
twain.quotations.create!(:quote => "Don't let schooling interfere with your education.")

churchill.quotations.create!(:quote => 'We make a living by what we get, but we make a life by what we give.')
churchill.quotations.create!(:quote => "You have enemies? Good. That means you've stood up for something, sometime in your life.")
churchill.quotations.create!(:quote => 'History will be kind to me for I intend to write it.')
