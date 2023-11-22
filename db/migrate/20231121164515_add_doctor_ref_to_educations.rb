class AddDoctorRefToEducations < ActiveRecord::Migration[7.1]
  def change
    add_reference :educations, :doctor, foreign_key: true
  end
end


