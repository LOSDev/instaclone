class AddImageFilterToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_filter, :string, default: "no_filter"
  end
end
