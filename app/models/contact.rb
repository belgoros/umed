class Contact
   include ActiveModel::Model

   attr_accessor :email, :message, :name

   EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/

   validates :name, presence: true
   validates :email, presence: true, format: { with: EMAIL_REGEX}
   validates :message, presence: true, length: { maximum: 500 }
end
