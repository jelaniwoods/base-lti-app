class CreateConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :consumptions, id: :uuid do |t|
      t.uuid :tool_consumer_id
      t.uuid :credential_id

      t.timestamps
    end
  end
end

