class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions, id: :uuid do |t|
      t.uuid :enrollment_id
      t.uuid :resource_id
      t.float :score, default: 0.0

      t.timestamps
    end
  end
end
