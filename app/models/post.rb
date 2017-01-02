class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait_check

  def clickbait_check
    if !title.nil?
      unless ["Won't Believe", "Secret", "Top", "Guess"].any? { |word| title.include?(word) }
        errors[:title] << 'Needs to be more clickbait-y!'
      end
    end
  end

end
