class CreateTageds < ActiveRecord::Migration[5.2]
  def change
    create_table :tageds do |t|
      t.string :name
      t.date :time
      t.references :link, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
