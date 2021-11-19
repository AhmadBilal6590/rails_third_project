class Post < ApplicationRecord
    # include PgSearch::Model
    # pg_search_scope :search_by_post_name, against: :post_name
    mount_uploader :image , FileUploader
    belongs_to :user

    has_many :comments

end
