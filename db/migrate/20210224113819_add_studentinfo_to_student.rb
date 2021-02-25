class AddStudentinfoToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :studentinfo_id, :integer 
  end
end
