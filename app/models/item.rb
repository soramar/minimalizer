class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
  validates :category, inclusion: { in: ["服", "家具", "貴重品"] }
  validates :price, numericality: {only_integer: true}
  validates :description, length: { maximum: 300 }  
end
