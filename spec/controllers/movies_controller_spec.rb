require 'spec_helper'

describe MoviesController do

  describe 'Deleting Movies' do
    it 'should destroy movies properly' do
      m1=mock("Movie")
      Movie.stub(:find).and_return(m1)
      m1.stub(:title).and_return("blah")
      m1.should_receive(:destroy)
      delete :destroy,  {:id=>"1"}
     end
    end

  describe 'viewing similar movies' do
    it 'should show all of the movies by the same director' do
      m1=mock("Movie")
      Movie.stub(:find).and_return(m1)
      m2=mock("Movie2")
      m1.stub(:director).and_return("myself")
      Movie.stub(:find_all_by_director).and_return([m1, m2])
      expected_results=[m1, m2]
      Movie.should_receive(:find_all_by_director).and_return(expected_results)

      get :similar, {:id=>"1"}
    end
    it 'should show the homepage with no director' do
      m1=mock("Movie")
      Movie.stub(:find).and_return(m1)
      m1.stub(:director).and_return(nil)
      m1.stub(:title).and_return("fake movie")

      get :similar, {:id=>"1"}

      response.should_not render_template('similar')
     end

  end



end
