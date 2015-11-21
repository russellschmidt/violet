class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :ratings, :rating, :severity
  end
end
