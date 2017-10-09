class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table(:notes, primary_key: 'id') do |t|
      t.string :entry
      t.belongs_to :patient, index: true
      t.timestamps
    end
  end
end
