require 'rails_helper'

RSpec.describe "polls/edit", type: :view do
  before(:each) do
    @poll = assign(:poll, Poll.create!(
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit poll form" do
    render

    assert_select "form[action=?][method=?]", poll_path(@poll), "post" do

      assert_select "input#poll_new[name=?]", "poll[new]"

      assert_select "input#poll_create[name=?]", "poll[create]"

      assert_select "input#poll_update[name=?]", "poll[update]"

      assert_select "input#poll_destroy[name=?]", "poll[destroy]"
    end
  end
end
