require 'rails_helper'

RSpec.describe "debts/new", type: :view do
  before(:each) do
    assign(:debt, Debt.new(
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new debt form" do
    render

    assert_select "form[action=?][method=?]", debts_path, "post" do

      assert_select "input#debt_new[name=?]", "debt[new]"

      assert_select "input#debt_create[name=?]", "debt[create]"

      assert_select "input#debt_update[name=?]", "debt[update]"

      assert_select "input#debt_destroy[name=?]", "debt[destroy]"
    end
  end
end
