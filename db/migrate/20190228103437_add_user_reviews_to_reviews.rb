class AddUserReviewsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_rating, :integer
    add_column :reviews, :user_comment, :text
    rename_column :reviews, :rating, :personality_rating
    rename_column :reviews, :comment, :personality_comment
  end
end
