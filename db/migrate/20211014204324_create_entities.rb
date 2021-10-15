# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :parsed_url
      t.string :parsed_info
      t.timestamps
    end
    add_index :entities, :name, unique: true
  end
end
