require 'rails_helper'

RSpec.describe "debts/index", type: :view do
  before(:each) do
    assign(:debts, [
      Debt.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      ),
      Debt.create!(
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of debts" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
