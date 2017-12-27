class Movie < ActiveRecord::Base
  has_many :reviews

  def number
      self.reviews.count
  end

  def avg
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    if self.reviews.count == 0
      0
    else
    sum.to_f / self.reviews.count
    end
  end
end
