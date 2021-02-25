class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.belongs_to :student, foreign_key: true, null: false
      t.belongs_to :Studentinfo
      t.string :subjects
      t.string :gread

      t.timestamps
    end
  end
end
