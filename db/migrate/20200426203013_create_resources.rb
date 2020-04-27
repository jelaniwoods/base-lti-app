class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources, id: :uuid do |t|
      t.string :id_from_tc
      t.string :title
      t.uuid :context_id

      t.timestamps
    end
  end
end
