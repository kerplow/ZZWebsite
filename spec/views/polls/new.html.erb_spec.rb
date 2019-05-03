require 'rails_helper'

RSpec.describe "polls/new", type: :view do
  before(:each) do
    assign(:poll, Poll.new(
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new poll form" do
    render

    assert_select "form[action=?][method=?]", polls_path, "post" do

      assert_select "input#poll_new[name=?]", "poll[new]"

      assert_select "input#poll_create[name=?]", "poll[create]"

      assert_select "input#poll_update[name=?]", "poll[update]"

      assert_select "input#poll_destroy[name=?]", "poll[destroy]"
    end
  end
end
