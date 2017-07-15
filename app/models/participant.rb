class Participant < ActiveRecord::Base
	belongs_to :event , class_name: "Event", foreign_key: "event_id"
	 validates :event_id , presence: true

  validates :name, presence: true , length: { maximum: 100}
  validates :address, presence: true , length: { maximum: 255}
 
  validates :phone, presence: true , length: { maximum: 10}

  validates :name, presence: true , length: { maximum: 50}
  validates :address, presence: true , length: { maximum: 255}
 
 validates_presence_of :phone,   :presence => {:message => 'invalid format of phone no!'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

end
