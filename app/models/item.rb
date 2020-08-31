class Item < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :url
    validates :code
    validates :description       
  end

end
