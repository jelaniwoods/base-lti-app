class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments, id: :uuid do |t|
      t.string :roles
      t.uuid :context_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
