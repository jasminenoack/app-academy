class AnswerChoice < ActiveRecord::Base
  validates :question_id, :body, presence: true

  belongs_to(
    :question,
    class_name: 'Question',
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :answer_id,
    primary_key: :id
  )


  

end
