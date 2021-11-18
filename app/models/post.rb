class Post < ApplicationRecord
    # include PgSearch::Model
    mount_uploader :image , FileUploader
    belongs_to :user

    has_many :comments

end
