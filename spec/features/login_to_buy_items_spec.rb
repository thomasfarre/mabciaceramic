require 'rails_helper'

feature 'Buy an item' do
  before(:all) do
    User.create(first_name: 'Toto', last_name: 'LeToto', email: 'toto@toto.com', password: '123456')
    # Rails.application.load_seed
  end
  scenario 'login' do
    visit root_path

    first(:link, "Se connecter").click

    expect(page.current_path).to eq(new_user_session_path)

    fill_in "user_email", with: "toto@toto.com"
    fill_in "user_password", with: "123456"
    click_on "Se connecter"

    expect(page.current_path).to eq(root_path)
    expect(page).to have_content "Se déconnecter"
  end

  scenario 'add an item to cart' do
    visit root_path

    click_on('Découvrir')

    expect(page.current_path).to eq(items_path)

    items = page.all(".group").select do |a|

      a.has_no_css?(".text-white")
    end

    item = items.first
    item_id = item[:href].gsub(/\D/, '').to_i
    item.click
    expect(page.current_path).to eq(item_path(item_id))

    click_on('Ajouter au panier')

    expect(page).to have_content "1 article dans votre panier"
  end
end
