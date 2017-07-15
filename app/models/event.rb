class Event < ActiveRecord::Base

  belongs_to :user
has_many :participants , class_name: "Participant",dependent: :destroy


validates :name,  length: { maximum: 60 }, acceptance: true
validates :coordinator_name,  length: { maximum: 30 }, acceptance: true
validates :location,length: { maximum: 255 }, acceptance: true
validates :duration, inclusion: { in: 0..9 } , numericality: true
validates :coordinator_name, length: { maximum: 60 }
validates :coordinator_phone, numericality: true
validates :moto ,length: { maximum: 255 }, acceptance: true
validates :who_can_participate ,length: { maximum: 255 }, acceptance: true
validates :event_cost ,length: { maximum: 50 }, acceptance: true

validates :coordinator_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates :coordinator_email, presence: true
validates :coordinator_email, uniqueness: true


  attr_accessor :start_time
end

