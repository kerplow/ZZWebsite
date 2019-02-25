require 'rails_helper'

RSpec.describe "debts/edit", type: :view do
  before(:each) do
    @debt = assign(:debt, Debt.create!(
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit debt form" do
    render

    assert_select "form[action=?][method=?]", debt_path(@debt), "post" do

      assert_select "input#debt_new[name=?]", "debt[new]"

      assert_select "input#debt_create[name=?]", "debt[create]"

      assert_select "input#debt_update[name=?]", "debt[update]"

      assert_select "input#debt_destroy[name=?]", "debt[destroy]"
    end
  end
end
