class Task < ApplicationRecord
  validates :task , presence: true , lenght:{ maximum:255 }
end
