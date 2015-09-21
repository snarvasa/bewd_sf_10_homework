class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy           #articles can have many comments. Comments will be deleted if an article is deleted.

  validates :title, presence: true,
                      length: { minimum: 5 }        #validates that all articles have a title and it is 5 chars long
end
