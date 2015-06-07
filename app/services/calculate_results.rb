class CalculateResults
  def self.calculate(vote_params)
    result = 0
    vote_params["questions_attributes"].values.each do |question_value|
      question_value["answers_attributes"].values.each do |answer_value|
        answer = Answer.find_by(id: answer_value["id"])
        if answer.correct? && answer.correct? == !answer_value["correct"].to_i.zero?
          result += 1
        end
      end
    end
    result
  end
end