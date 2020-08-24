class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :url
    validates :code
    validates :description       
  end

end
