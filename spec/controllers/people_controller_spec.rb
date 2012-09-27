require 'spec_helper'

describe Api::V1::PeopleController do

  before(:each) do
    Person.create!(:name => 'Mark Twain',      :occupation => 'Author', :fictional => false)
    Person.create!(:name => 'Kurt Vonnegut',   :occupation => 'Author', :fictional => false)
    Person.create!(:name => 'Jules Winnfield', :occupation => 'Hitman', :fictional => true)
    Person.create!(:name => 'Bruce Wayne',     :occupation => 'Batman', :fictional => true)
  end

  describe 'GET index' do

    it 'lists all people' do
      get :index, :format => :json

      response.status.should eql 200
      response.body.should eql Person.all.to_json
    end

  end

  describe 'GET show' do

    it 'shows a person' do
      get :show, :id => Person.first.id, :format => :json

      response.status.should eql 200
      response.body.should eql Person.first.to_json
    end

  end

  describe 'POST create' do

    let(:attrs) { { :name => 'Harvey Dent', :occupation => 'District Attorney', :fictional => false } }

    it 'creates a person' do
      expect { post :create, :person => attrs, :format => :json }.to change(Person, :count).by(1)

      response.status.should eql 201
      response.body.should eql Person.last.to_json
    end

  end

  describe 'PUT update' do

    it 'updates a person' do
      put :update, :id => 1, :person => { :occupation => 'Novelist' }, :format => :json

      response.status.should eql 204
    end

  end

  describe 'DELETE destroy' do

    it 'destroys a person' do
      delete :destroy, :id => 1, :format => :json

      response.status.should eql 204
    end

  end

end
