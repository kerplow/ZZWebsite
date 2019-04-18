require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'guest user' do
    context 'with valid attributes' do
      subject { create :user, :guest }
      it { expect{subject}.to change(User, :count).by 1 }
    end

    context 'with a room' do
      subject { create :user, :guest, room: create(:room) }
      it { expect{ subject }.to raise_error(ActiveRecord::RecordInvalid) }
      it { expect(subject.errors.messages.keys).to eq([:guest]) }
    end
  end

  describe 'housemates' do
    let(:room) { create(:room) }
    it 'with valid attributes' do
      user = create :user, :housemate, room: room
      expect{it}.to change(User, :count).by 1
      expect(user.room).to eq(room)
    end

    it 'without  room' do
      subject { create :user, :housemate }
      it { expect{ subject }.to raise_error(ActiveRecord::RecordInvalid) }
      it { expect(subject.errors.messages.keys).to eq([:housemate]) }
    end
  end

  describe 'subrenters' do
    context 'valid' do
      subject { create :user, :guest }
      it { expect{subject}.to change(User, :count).by 1 }
      it { expect.to change(User, :count).by 1 }
    end
  end
end
