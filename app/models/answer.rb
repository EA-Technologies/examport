class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  has_many :validations, dependent: :destroy
  
  # Scopes
  default_scope { order ("display_order ASC") }
end
