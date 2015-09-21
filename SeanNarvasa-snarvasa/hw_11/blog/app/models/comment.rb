class Comment < ActiveRecord::Base
  belongs_to :article           #Each comments belongs to an article
end
