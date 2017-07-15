class ProblemCategory < ActiveRecord::Base
has_many :problem_posts , class_name: "ProblemPost"
validates :category_id , presence: true
  validates :name_category , presence: true , length: { maximum: 255}
end
