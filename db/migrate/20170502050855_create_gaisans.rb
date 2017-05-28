class CreateGaisans < ActiveRecord::Migration
  def change
    create_table :gaisans do |t|
      t.text :kosuu

      t.timestamps null: false
    end
  end
end
