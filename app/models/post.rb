class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %W(Fiction Non-Fiction), message: "Invalid Category" }
  validate :title_is_clickbait

  def title_is_clickbait
    if self.title == nil
      errors.add(:title, "Invalid Title")
    elsif !self.title.include? "Won't Believe" || "Secret" || "Top" || "Guess"
      errors.add(:title, "This isn't clickbait.")
    end
  end
end
