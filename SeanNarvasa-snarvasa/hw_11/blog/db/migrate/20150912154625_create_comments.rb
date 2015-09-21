class CreateComments < ActiveRecord::Migration
  def change                                                      #creates a new method called 'change'
    create_table :comments do |t|                                 #creates a new comments table
      t.string :commenter                                         #creates a column for commenters
      t.text :body                                                #creates a column for body text
      t.references :article, index: true, foreign_key: true       #creates an integer column for article_id, an index, and a foreign key constraint

      t.timestamps null: false
    end
  end
end
