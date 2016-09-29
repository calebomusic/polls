# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#

class Response < ActiveRecord::Base
  validates :answer_choice_id, :respondent_id, presence: true
  validate :sibling_responses, :author_cant_respond_to_own_poll
  # validates_uniqueness_of :scope => [:answer_choice_id, :respondent_id]

  belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :respondent_id

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_choice_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    responses = self.question.responses.where.not(id: self.id)

    unless responses.empty?
      errors[:duplicate_responses] << "Can't answer the same question twice"
    end
  end

  def author_cant_respond_to_own_poll
    if self.question.author_id == self.respondent_id
      errors[:vanity_responses] << "Can't respond to your own question"
    end
  end

end
