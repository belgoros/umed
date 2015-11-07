class Image < ActiveRecord::Base
  belongs_to :question
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo, presence: true, content_type: { content_type: "image/png" }, size: { in: 0..300.kilobytes }
end
