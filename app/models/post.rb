class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid size"}
  validate :clickbaity


def clickbaity
  self.title ||= ""
  if ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|word| self.title.include?(word)} == false
    errors.add(:title, "needs to be more clickbaity")
  end
end

end
