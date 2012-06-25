require 'spec_helper'

describe Movie do
    describe 'all ratings' do
      Movie.all_ratings.count.should == 5
    end
 end

