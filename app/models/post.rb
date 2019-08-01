class Post < ApplicationRecord
  # 1ページあたり3項目表示
  paginates_per 3

  # リレーション
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # 新規投稿処理
  def create
    @post = Post.new(post_params)
    upload_file = params[:post][:upload_file]
    # 投稿画像がない場合
    if upload_file.blank?
      flash[:danger] = "投稿には画像が必須です。"
      redirect_to new_post_path and return
    end
  end

  # 投稿が特定のユーザーにいいね！されているかどうかを判定
  def like_from?(user)
    self.post_likes.exists?(user_id: user.id)
  end
end
