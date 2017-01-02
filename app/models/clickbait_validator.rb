class ClickbaitValidator < ActiveModel::Validator
  def validate(post)
    unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? { |word| post.title.include?(word) }
      post.errors[:title] << 'Needs to be more clickbait-y!'
    end
  end
end
