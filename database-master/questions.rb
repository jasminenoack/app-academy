require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions2.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end

class Row
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
    SQL

    results.map { |result| self.new(result)}.first
  end

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM #{self.table_name}")
    results.map { |result| self.new(result) }
  end

  def author
    raise 'invalid' unless ['Question', 'Reply'].include?(self.class)
    User.find_by_id(self.user_id)
  end

  def save
    ivars = self.instance_variables.map { |ivar| ivar[1..-1] }
    ivars.pop

    params = ivars.map.with_object([]) do |ivar, params|
      params << self.send(ivar)
    end

    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, *params)
        INSERT INTO
          #{self.class.table_name} (#{ivars.join(', ')})
        VALUES
          (#{Array.new(ivars.count, '?').join(', ')})
      SQL

      @id = QuestionsDatabase.instance.last_insert_row_id

    else
      QuestionsDatabase.instance.execute(<<-SQL, *params)
        UPDATE
          #{self.class.table_name}
        SET
          #{ivars.map { |ivar| ivar + ' = ?' }.join(', ')}
        WHERE
          #{self.class.table_name}.id = #{self.id}
      SQL
    end
  end
end

class Question < Row

  def self.table_name
    "questions"
  end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.user_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_followed(n)
    QuestionFollower.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_accessor :title, :body, :user_id, :id

  def initialize(options = {})
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
    @id = options['id']
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  def followers
    QuestionFollower.followers_for_question_id(self.id)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end

end

class User < Row

  def self.table_name
    "users"
  end

  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    results.map { |result| User.new(result) }.first
  end

  attr_accessor :id, :fname, :lname

  def initialize(options = {})
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollower.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    results = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        CAST( SUM(question_counts.count) AS float) / COUNT(question_counts.user_id) karma
      FROM
        users
      JOIN
        (
          SELECT
            questions.*, COUNT(question_likes.id) count
          FROM
            questions
          LEFT OUTER JOIN
            question_likes
          ON
            questions.id = question_likes.question_id
          GROUP BY
            questions.id
          ) question_counts
      ON
        question_counts.user_id = users.id
      WHERE
        users.id = ?
      GROUP BY
        users.id
    SQL

    results.first['karma']

  end

end

class Reply < Row
  attr_accessor :id, :user_id, :question_id, :parent_id, :body

  def self.table_name
    "replies"
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.question_id = ?
    SQL

    results.map { |result| Reply.new(result) }
  end

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.user_id = ?
    SQL

    results.map { |result| Reply.new(result) }
  end

  def initialize(options = {})
    @question_id = options['question_id']
    @user_id = options['user_id']
    @body = options['body']
    @parent_id = options['parent_id']
    @id = options['id']
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id) if parent_id
  end

  def child_replies
    results = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.parent_id = ?
    SQL

    results.map { |result| Reply.new(result) }
  end

end

class QuestionFollower < Row

  attr_accessor :id, :user_id, :question_id

  def self.table_name
    "question_followers"
  end

  def self.followers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_followers
      ON
        users.id = question_followers.user_id
      WHERE
        question_followers.question_id = ?
    SQL

    results.map { |result| User.new(result) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_followers
      INNER JOIN
        questions
      ON
        questions.id = question_followers.question_id
      WHERE
        question_followers.user_id = ?

    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_followers
      ON
        question_followers.question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_followers.id) DESC
      LIMIT
        ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def initialize(options = {})
    @question_id = options['question_id']
    @user_id = options['user_id']
    @id = options['id']
  end

end

class QuestionLike < Row

  attr_accessor :id, :user_id, :question_id

  def self.table_name
    "question_likes"
  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) count
      FROM
        question_likes
      WHERE
        question_id = ?
      GROUP BY
        question_id
    SQL

    results.first["count"]
  end

  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes
      ON
        users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    results.map { |result| User.new(result) }
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?

    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON
        question_likes.question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_likes.id) DESC
      LIMIT
        ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def initialize(options = {})
    @user_id = options['user_id']
    @question_id = options['question_id']
    @id = options['id']
  end

end
