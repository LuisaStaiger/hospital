class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :degree_name
      t.integer :score
      t.timestamps
    end
  end
end


# - University
# - Degree Name
# - Must belgong to a doctor
# - Must get destroyed when a doctor gets destroyed
# - Score - has to be above 50 and below 100
