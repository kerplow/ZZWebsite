require 'rails_helper'

RSpec.describe "polls/index", type: :view do
  before(:each) do
    assign(:polls, [
      Poll.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      ),
      Poll.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of polls" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
