class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, length: {maximum: 255}

  has_many(
    :polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id
  )

  def completed_polls

    completed = Poll.find_by_sql(<<-SQL)
      SELECT
        polls.*
      FROM
        polls
      LEFT OUTER JOIN
        questions
        ON polls.id = questions.poll_id
      LEFT OUTER JOIN
              (SELECT
                 responses.*
              FROM
                 responses
              WHERE
                 responses.user_id = #{id}
              ) bono_responses
            ON bono_responses.question_id = questions.id
      GROUP BY
        polls.id
      HAVING
        COUNT(questions.id) = COUNT(bono_responses.id)

    SQL
    completed.map { |poll| poll}
  end

  def uncompleted_polls

    uncompleted = Poll.find_by_sql(<<-SQL)
      SELECT
        polls.*
      FROM
        polls
      LEFT OUTER JOIN
        questions
        ON polls.id = questions.poll_id
      LEFT OUTER JOIN
              (SELECT
                 responses.*
              FROM
                 responses
              WHERE
                 responses.user_id = #{id}
              ) bono_responses
            ON bono_responses.question_id = questions.id
      GROUP BY
        polls.id
      HAVING
        COUNT(questions.id) != COUNT(bono_responses.id)
        AND COUNT(bono_responses.id) > 0

    SQL
    uncompleted.map { |poll| poll}
  end

end
