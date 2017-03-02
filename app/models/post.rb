class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:10}
  validates :summary, length: {maximum:50}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait

  def clickbait
    cbait = ["Won't Believe", "Secret", "Top number", "Guess"]
    if title && !cbait.any?{|bait|title.include?(bait)}
      self.errors[:clickbait] << "NO CLICKBAIT!!!"
    end
  end
end
