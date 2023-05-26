class AddMoviesToActors < ActiveRecord::Migration[7.0]
  def change
    add_reference :actors, :actor, null: false, foreign_key: true
  end
end
