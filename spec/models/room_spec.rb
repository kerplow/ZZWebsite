require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'CRUD' do
    context 'valid attributes' do
      subject { create :room }
      it{ expect{ subject }.to change(Room, :count).by 1 }
    end

    context 'duplicate rooms' do
      before { create :room, number: 2 }
      subject { create :room, number: 2 }
      it{ expect{ subject }.to raise_error(ActiveRecord::RecordInvalid) }
    end

    context 'invalid room' do
      subject { create :room, number: 44 }
      it{ expect{ subject }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
