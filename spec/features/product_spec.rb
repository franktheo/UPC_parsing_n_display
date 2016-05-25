require "rails_helper"

RSpec.feature "Product", :type => :feature do

  scenario "Verifying invalid UPC code", :js => true do

    visit root_path
    expect(page).to have_text("Upc code")

    fill_in 'product_upc_code', with: '1111'
    click_button 'submit'
    expect(page).to have_text("UPC code is not valid")

    sleep(2)

  end

  scenario "Verifying a valid UPC code", :js => true do

    visit root_path

    fill_in 'product_upc_code', with: '3564700309575'
    click_button 'submit'
    expect(page).to have_text("Product created")
    sleep(5)

  end

  scenario "Verifying a duplicate UPC code", :js => true do

    visit root_path

    fill_in 'product_upc_code', with: '3564700309575'
    click_button 'submit'
    expect(page).to have_text("Duplicate UPC")
    sleep(5)

  end

  scenario "Verifying Index Page", :js => true do

    visit products_path
    #expect(page).to have_text("Show")
    #expect(page).to have_text("Remove")
    click_link('Show', match: :first)
    page.driver.go_back
    click_button('Remove', match: :first)

  end

end
