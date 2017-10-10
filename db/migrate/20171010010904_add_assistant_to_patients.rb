class AddAssistantToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :assistant, :string
    add_column :patients, :home_health_company, :string
    add_column :patients, :initial_eval_date, :string
    add_column :patients, :visit_frequency, :string
  end
end
