class Api::V1::QuotationsController < Api::V1::ApiController

  before_filter :find_person
  before_filter :find_quotation, :only => [ :show, :update, :destroy ]

  def index
    @quotations = @person.quotations.all

    respond_with @quotations
  end  

  def show
    respond_with @quotation
  end

  def create
    @quotation = @person.quotations.build(params[:quotation])
    @quotation.save

    respond_with @quotation, :location => nil
  end

  def update
    @quotation.update_attributes(params[:quotation])

    respond_with @quotation
  end

  def destroy
    @quotation.destroy

    respond_with @quotation
  end

  protected

    def find_person
      @person = Person.find_by_id(params[:person_id])
    end

    def find_quotation
      @quotation = @person.quotations.find(params[:id])
    end

end
