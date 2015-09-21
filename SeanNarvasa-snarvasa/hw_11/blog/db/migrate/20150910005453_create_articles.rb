class CreateArticles < ActiveRecord::Migration
  def change                              #creates a new method called 'change'
    create_table :articles do |t|         #creates a new articles table
      t.string :title                     #creates the title column (string)
      t.text :text                        #creates a text column (text)

      t.timestamps null: false            #creates timestamp fields for each column (auto-created)
    end
  end
end
