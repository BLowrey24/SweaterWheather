require 'rails_helper'

RSpec.describe Activity do
  let(:forecast_data) do
    {
      destination: 'Chicago, IL',
      forecast: {
        summary: 'Cloudy',
        temperature: '55 F'
      }
    }
  end

  let(:activities_data) do
    {
      activities: {
        recreational: {
          activity: 'Go for a hike',
          type: 'recreational',
          participants: 2,
          price: 0
        },
        busywork: {
          activity: 'Organize your desk',
          type: 'busywork',
          participants: 1,
          price: 0.5
        },
        cooking: {
          activity: 'Try a new recipe',
          type: 'cooking',
          participants: 1,
          price: 0
        }
      }
    }
  end

  subject(:activity) { described_class.new(forecast_data, activities_data) }

  describe '#initialize' do
    it 'sets the destination' do
      expect(activity.destination).to eq('Chicago, IL')
    end

    it 'sets the forecast' do
      expect(activity.forecast).to eq({
        summary: 'Cloudy',
        temperature: '55 F'
      })
    end

    it 'sets the activities' do
      expect(activity.activities).to eq({
        recreational: {
          activity: 'Go for a hike',
          type: 'recreational',
          participants: 2,
          price: 0
        },
        busywork: {
          activity: 'Organize your desk',
          type: 'busywork',
          participants: 1,
          price: 0.5
        },
        cooking: {
          activity: 'Try a new recipe',
          type: 'cooking',
          participants: 1,
          price: 0
        }
      })
    end

    it 'sets the id to nil' do
      expect(activity.id).to be_nil
    end
  end
end