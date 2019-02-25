require 'rails_helper'

RSpec.describe "debts/show", type: :view do
  before(:each) do
    @debt = assign(:debt, Debt.create!(
      :new => "New",
      :create => "Create",
      :update => "Update",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Create/)
    expect(rendered).to match(/Update/)
    expect(rendered).to match(/Destroy/)
  end
end
