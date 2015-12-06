class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :dietitian_id
      t.datetime :time
      t.string :status
      t.integer :client_id

      t.timestamps

    end
  end
end
