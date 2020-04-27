class CreateLaunches < ActiveRecord::Migration[6.0]
  def change
    create_table :launches, id: :uuid do |t|
      t.uuid :context_id
      t.uuid :resource_id
      t.uuid :enrollment_id
      t.uuid :user_id
      t.uuid :tool_consumer_id
      t.jsonb :payload, null: false, default: {}

      t.timestamps
    end
  end
end
