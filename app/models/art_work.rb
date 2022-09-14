class ArtWork < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
end
