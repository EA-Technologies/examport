class Validation < ActiveRecord::Base
  belongs_to :answer
  has_many :validation_conditions, dependent: :destroy
end