class RemoveBornFromActor < ActiveRecord::Migration[7.0]
  def change
    remove_column :actors, :born, :integer
  end
end
