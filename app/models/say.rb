class Say < ApplicationRecord
  # contentが1文字以上140文字以下の場合のみ許すようバリデーションを設定する
  validates :content, length: {in: 1..140}
end
