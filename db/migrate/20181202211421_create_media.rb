class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end