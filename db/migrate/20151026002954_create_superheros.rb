class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :height
      t.string :bio
      t.string :image_url

      t.timestamps null: false
    end
  end
end
