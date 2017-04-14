class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def post_id=(post_id)
    self.post = Post.find_by(id: post_id)
  end

  def user_attributes=(user_attributes)
    if !user_attributes.has_value?("")
      self.user = User.find_or_create_by(username: user_attributes[:username])
    end
  end

  def user_id=(user_id)
    if user_id != ""
      self.user = User.find(user_id)
    end
  end
end
