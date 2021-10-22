class CreateAnnotationSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :annotations do |t|
      t.text :content
      t.string :lat
      t.string :long
      t.bigint :user_id
      t.timestamps
    end

    add_foreign_key :annotations, :users
  end
end
