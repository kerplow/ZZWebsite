require 'rails_helper'

RSpec.describe PlannerEvent, type: :model do

  describe 'CRUD' do
    describe 'create' do
      context 'valid attributes' do
        subject { create :planner_event }
        it { expect{subject}.to change(PlannerEvent, :count).by(1) }
        it { expect(subject.name).to eq('Event 2') }
      end

      context 'missing user but private' do
        subject { create :planner_event, :private }
        it { expect{subject}.to raise_error(ActiveRecord::RecordInvalid) }
      end
    end

    describe 'update' do
      before do
        @planner_event = create :planner_event
        @planner_event.update(subject)
      end
      context 'valid attributes' do
        subject { { name: 'updated_name' } }
        it { expect{subject}.not_to change(PlannerEvent, :count) }
        it { expect(@planner_event.name).to eq('updated_name') }
      end

      context 'invalid attributes' do
        subject { { is_public: false } }
        it { expect{subject}.not_to change(PlannerEvent, :count) }
        it { expect(@planner_event.errors.messages.keys).to eq([:user]) }
      end
    end
  end
end
