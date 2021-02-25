class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :password_digest
    
      t.timestamps
    end
    add_index :students, :email, unique: true
  end
end
