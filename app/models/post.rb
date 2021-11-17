class Post < ApplicationRecord
    mount_uploader :image , FileUploader
    belongs_to:user
end
