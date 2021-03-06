# == Schema Information
#
# Table name: polls
#
#  id        :integer          not null, primary key
#  author_id :integer          not null
#  title     :string           not null
#

class Poll < ActiveRecord::Base
  validates :author_id, :title, presence: true
  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id

  has_many :questions,
    class_name: :Question,
    primary_key: :id,
    foreign_key: :poll_id
end
