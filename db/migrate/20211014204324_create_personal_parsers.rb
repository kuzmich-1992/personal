# frozen_string_literal: true

class CreatePersonalParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_parsers do |t|
      t.string :name
      t.string :parsed_url
      t.string :parsed_info
      t.timestamps
    end
    add_index :personal_parsers, :name, unique: true
  end
end
