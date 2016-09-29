# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  name  :string           not null
#  email :string
#

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_many :polls,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :author_id

  has_many :responses,
    class_name: :Response,
    primary_key: :id,
    foreign_key: :respondent_id

end
