class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :follow_user, class_name: "User"
end
