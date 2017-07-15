class ProblemPost < ActiveRecord::Base
belongs_to :category , class_name: "ProblemCategory", foreign_key: "category_id" 
has_many :comments , class_name: "Comment",dependent: :destroy
validates :category_id , presence: true
  validates :title , presence: true , length: { maximum: 255}
  validates :category_name , presence: true , length: { maximum: 255}
  validates :content , presence: true 
  validates :name ,length: {maximum: 100}

end
