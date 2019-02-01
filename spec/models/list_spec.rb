require 'spec_helper'

describe List type: :model do
  context 'options' do
    it { expect { subject }.to change(Option, :count).by 1 }
  end
end