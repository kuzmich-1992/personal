# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :numbers
      t.string :parsed_url
      t.string :parsed_info
      t.timestamps
    end
    add_index :entities, :numbers
  end
end
