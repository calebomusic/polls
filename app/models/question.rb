# == Schema Information
#
# Table name: questions
#
#  id      :integer          not null, primary key
#  text    :string           not null
#  poll_id :integer          not null
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :poll_id

  has_many :answer_choices,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answer_counter = Hash.new(0)
    answer_choices = self.answer_choices
      .select("answer_choices.text, COUNT(responses.id) AS count")
      .joins("LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id")
      .where("answer_choices.question_id = ?", self.id)
      .group("answer_choices.id")
      .as_json

    # answer_choices.each do |answer_choice|
    #   answer_counter[answer_choice.text] += answer_choice.responses.length
    # end
    #
    # answer_counter
  end

  def other_results
    answer_counter = Hash.new(0)
    answer_choices = self.answer_choices
    answer_choices.each do |answer_choice|
      answer_counter[answer_choice.text] += answer_choice.responses.length
    end

    answer_counter
  end
end
