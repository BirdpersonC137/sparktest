class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address_line_1
      t.string :city
      t.string :province
      t.string :country_name
      t.string :postcode
      t.datetime :date_added
      t.string :how_did_you_hear_about_us
      t.string :what_is_your_budget
      t.string :what_is_your_favourite_color

      t.timestamps
    end
  end
end
