class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :uid
      t.string :title
      t.text :description
      t.integer :event_type
      t.integer :status
      t.boolean :system, default: false
      t.string :reminder_count
      t.string :url
      t.string :reminder_interval
      t.string :reminder_unit
      t.datetime :scheduled_at
      t.datetime :start_at
      t.datetime :end_at

      t.datetime :deleted_at

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end