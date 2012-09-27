class Api::V1::PeopleController < Api::V1::ApiController

  before_filter :find_person, :only => [ :show, :update, :destroy ]

  def index
    @people = Person.all

    respond_with @people
  end  

  def show
    respond_with @person
  end

  def create
    @person = Person.new(params[:person])
    @person.save

    respond_with @person, :location => nil
  end

  def update
    @person.update_attributes(params[:person])

    respond_with @person
  end

  def destroy
    @person.destroy

    respond_with @person
  end

  protected

    def find_person
      @person = Person.find(params[:id])
    end

end
