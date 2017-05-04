class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.boolean :active

      t.timestamps
    end
  end
end
