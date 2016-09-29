# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#

class Response < ActiveRecord::Base
  belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :respondent_id

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_choice_id
end
