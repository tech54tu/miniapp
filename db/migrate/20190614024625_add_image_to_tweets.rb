class AddImageToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :image, :text
  end
end
