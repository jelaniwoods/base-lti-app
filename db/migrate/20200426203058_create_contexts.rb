class CreateContexts < ActiveRecord::Migration[6.0]
  def change
    create_table :contexts, id: :uuid do |t|
      t.string :title
      t.string :id_from_tc
      t.uuid   :credential_id
      
      t.timestamps
    end
  end
end
