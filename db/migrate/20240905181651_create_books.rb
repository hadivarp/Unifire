class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :uid
      t.datetime :scheduled_at

      t.references :event, null: false, foreign_key: true
      t.references :organizer, null: false, foreign_key: { to_table: :users }
      t.references :attendee, null: false, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
