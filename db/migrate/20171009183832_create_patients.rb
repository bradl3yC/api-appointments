class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table(:patients, primary_key: 'id') do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.timestamps
    end
  end
end
