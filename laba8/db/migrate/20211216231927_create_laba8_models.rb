# frozen_string_literal: true

class CreateLaba8Models < ActiveRecord::Migration[6.0]
  def change
    create_table :laba8_models do |t|
      t.integer :number
      t.float :result
      t.string :iterates

      t.timestamps
    end
  end
end
