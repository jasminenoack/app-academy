class Response < ActiveRecord::Base
  validates :answer_id, :question_id, :user_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond_to_own_poll

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :answer,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id
  )

  has_many(
   :all_siblings,
   through: :question,
   source: :responses
  )

  has_one :poll, through: :question, source: :poll

  # def sibling_responses
  #   if persisted?
  #     all_siblings.where("responses.id <> ?", id)
  #   else
  #     all_siblings
  #   end
  # end

  def sibling_responses
    bindings = [question_id, user_id, id].compact
    responses = Response.find_by_sql([<<-SQL, *bindings])
       SELECT DISTINCT
         finish.*
       FROM
         responses start
       JOIN
         answer_choices one
         ON start.answer_id = one.id
       INNER JOIN
         questions
         ON questions.id = one.question_id
       INNER JOIN
         answer_choices many
         ON questions.id = many.question_id
       INNER JOIN
         responses finish
         ON finish.answer_id = many.id
      WHERE
         start.question_id = ?
         AND finish.user_id = ?
         #{"AND finish.id <> ?" if persisted?}
    SQL

  end

  private

  def respondent_has_not_already_answered_question
    answers = sibling_responses
    unless answers.empty?
      errors[:base] << "You can only answer a question once."
    end
  end

  def author_cannot_respond_to_own_poll
    if poll.author_id == user_id
      errors[:base] << "You cannot respond to your own poll Bono!"
    end
  end

end
