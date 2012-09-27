require 'spec_helper'

describe Api::V1::QuotationsController do

  let!(:twain)  { Person.create!(:name => 'Mark Twain', :occupation => 'Author', :fictional => false) }
  let!(:quote1) { twain.quotations.create!(:quote => 'The reports of my death have been greatly exaggerated.') }
  let!(:quote2) { twain.quotations.create!(:quote => 'Go to Heaven for the climate, Hell for the company.') }
  let!(:quote3) { twain.quotations.create!(:quote => 'Be careful about reading health books. You may die of a misprint.') }

  describe 'GET index' do

    it 'lists all quotations by a specific person' do
      get :index, :person_id => 1, :format => :json

      response.status.should eql 200
      response.body.should eql twain.quotations.all.to_json
    end

  end

  describe 'GET show' do

    it 'shows a quotation by a specific person' do
      get :show, :person_id => twain.id, :id => quote1.id, :format => :json

      response.status.should eql 200
      response.body.should eql quote1.to_json
    end

  end

  describe 'POST create' do

    let(:attrs) { { :quote => "I don't like to commit myself about heaven and hell - you see, I have friends in both places." } }

    it 'creates a quotation for a specific person' do
      expect { post :create, :person_id => twain.id, :quotation => attrs, :format => :json }.to change(Quotation, :count).by(1)

      response.status.should eql 201
      response.body.should eql twain.quotations.last.to_json
    end

  end

  describe 'PUT update' do

    it 'updates a quotation for a specific person' do
      put :update, :person_id => twain.id, :id => quote1.id, :quotation => { :quote => "Don't let schooling interfere with your education." }, :format => :json

      response.status.should eql 204
    end

  end

  describe 'DELETE destroy' do

    it 'destroys a quotation for a specific person' do
      delete :destroy, :person_id => twain.id, :id => 1, :format => :json

      response.status.should eql 204
    end

  end

end
