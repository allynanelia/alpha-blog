class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles , :description, :text #table name, name of attribute, data type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime #need both created at and updated at if not rails will not track
  end
end
