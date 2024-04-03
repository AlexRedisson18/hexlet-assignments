# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_reference :tasks, :user, foreign_key: true
    add_reference :tasks, :status, foreign_key: true
  end
end
