class ArticleImage < ApplicationRecord
  belongs_to :article, optional: true
end
