class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cuteness, :softness,
            numericality: { only_integer: true, in: 1..10, message: "must be between 1 and 10" }
end
