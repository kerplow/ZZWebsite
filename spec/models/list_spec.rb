require 'rails_helper'

RSpec.describe List, type: :model do
  let!(:valid_attributes) { { title: "test", description: 'testing' } }

  context 'CRUD' do
    describe 'Create' do
      subject { List.new(valid_attributes) }
      it { expect{ subject.save }.to change(List, :count).by 1 }
    end

    describe 'update' do
      let!(:list) { create(:list) }
      let!(:og_user) { create(:user) }
      let!(:second_user) { create(:user) }
      subject { list.update(title: 'updated title') }
      context 'valid user' do
        it { expect{ subject }.not_to change(List, :count) }
        it { expect{ subject }.to  }
      end
    end

    describe 'delete' do

    end
  end

  context 'options' do
    it { expect { subject }.to change(Option, :count).by 1 }
  end
end
