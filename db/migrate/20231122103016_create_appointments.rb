class CreateAppointments < ActiveRecord::Migration[7.1]
  def change

    create_table "appointments", force: :cascade do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :date
      t.text :cause
      t.boolean :urgent, default: false

      t.timestamps

    end
  end
end
