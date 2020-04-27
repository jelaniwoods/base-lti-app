class CreateToolConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :tool_consumers, id: :uuid do |t|
      t.string :instance_guid
      t.string :instance_name
      t.string :instance_description
      t.string :instance_url
      t.string :instance_contact_email

      t.timestamps
    end
  end
end
