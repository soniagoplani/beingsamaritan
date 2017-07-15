class Comment < ActiveRecord::Base
	belongs_to :post , class_name: "ProblemPost", foreign_key: "post_id" 
    validates :post_id , presence: true
  validates :body, presence: true , length: { maximum: 255}
  validates :name, presence: true , length: { maximum: 100}

end
