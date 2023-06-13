require 'rails_helper'

RSpec.describe ActivityService do 
  describe 'Establish connection' do
    it 'can connect to the Bored API', :vcr => { :record => :new_episodes } do
      activity_search = ActivityService.new.get_activities('chicago,il')
      expect(activity_search).to be_a Hash
      expect(activity_search).to have_key :activity
      expect(activity_search[:activity]).to be_a String
      expect(activity_search).to have_key :type
      expect(activity_search[:type]).to be_a String
      expect(activity_search).to have_key :participants
      expect(activity_search[:participants]).to be_a Integer
      expect(activity_search).to have_key :link
      expect(activity_search[:link]).to be_a String
    end
  end
end