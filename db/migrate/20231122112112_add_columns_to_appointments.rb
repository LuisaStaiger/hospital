class AddColumnsToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :date, :datetime
    add_column :appointments, :cause, :text
    add_column :appointments, :urgent, :boolean, default: false
    add_reference :appointments, :doctor, foreign_key: true
    add_reference :appointments, :patient, foreign_key: true
  end
end
