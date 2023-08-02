require "rails_helper"

describe "Root" do
  around do |example|
    with_accessibility_audit_options skipping: %w[
    html-has-lang
    landmark-one-main
    page-has-heading-one
    region
    ] do
      example.run
    end
  end

  it "works fine", js: true do
    visit root_path

    accept_confirm do
      click_on "Alert"
    end

    expect(page).to have_content("Root Show")
  end
end
