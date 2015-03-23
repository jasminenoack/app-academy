class Question < ActiveRecord::Base
  validates :poll_id, :body, presence: true

  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )



  def results

    all_responses = answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS count")
      .joins("LEFT OUTER JOIN responses
              ON responses.answer_id = answer_choices.id")
      .group("answer_choices.id")

    all_responses.map do |answer|
      [answer.body, answer.count]
    end
  end
end
