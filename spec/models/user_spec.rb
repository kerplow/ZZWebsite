require 'spec_helper'

describe User type: :model do
  describe 'creating a user' do
    context 'housemate' do
      subject { create :user, :guest }
      it { expect{subject}.to change(User, :count).by 1 }
      it { expect.to change(User, :count).by 1 }
    end


    context 'guest' do
      subject { create :user, :guest }
    end
  end
end
