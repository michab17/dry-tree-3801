class Hospital < ApplicationRecord
  has_many :doctors

  def universities
    doctors.select('DISTINCT doctors.university AS university')
  end
end
