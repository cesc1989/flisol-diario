class Entry < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
end

# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
