class CreateSays < ActiveRecord::Migration[5.1]
  def change
    create_table :says do |t|
      t.text :content

      t.timestamps
    end
  end
end
