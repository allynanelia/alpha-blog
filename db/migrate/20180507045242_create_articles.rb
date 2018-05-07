class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      #do not need to create id, rails will create for us
      t.string :title #data type string
    end
  end
end
