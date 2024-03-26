# frozen_string_literal: true
class CreateShareVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :share_videos do |t|
      t.string :title
      t.text :url
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
