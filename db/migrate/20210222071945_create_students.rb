class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
    	t.string :name
      t.date :dob
      t.integer :age
      t.string :personalemail
      t.string :parentemail
      t.string :hobby
      t.string :address
      t.string :permanentaddress
      t.string :phoneNo
      t.string :gender

      t.string :education
      t.text :city
      t.text :state
      t.string :socialId


      t.timestamps
    end
  end
end
