class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :actors, :movies do |t|
      # t.index [:"actors,_id", :movie_id]
      # t.index [:movie_id, :"actors,_id"]
    end
  end
end
