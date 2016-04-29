class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :todo_items, :commpleted, :completed
  end
end
