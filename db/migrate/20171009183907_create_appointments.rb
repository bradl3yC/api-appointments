class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table(:appointments, primary_key: 'id') do |t|
      t.datetime :date_time
      t.belongs_to :patient, index: true
      t.timestamps
    end
  end
end
