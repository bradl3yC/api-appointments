class RemoveInitialEvalDateFromPatients < ActiveRecord::Migration[5.1]
  def change
    remove_column :patients, :initial_eval_date, :string
  end
end
