class Question
  attr_reader :definition, :answer

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
  end

  def is_valid?(answer)
    self.answer == answer.downcase.strip
  end

  def to_s
    self.definition
  end
end