class CreatePersonalParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_parsers do |t|
      t.string :name

      t.timestamps
    end
    add_index :personal_parsers, :name, unique: true
  end
end
