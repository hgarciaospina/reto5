require 'csv'
require_relative 'question'

class StoreQuestion
  attr_reader :questions

  def initialize
    @questions = []

    build_questions
  end

  def take!
    @questions.shift
  end

  def length
    @questions.length
  end

  private
    def build_questions
      store = CSV.read('store-questions.txt').shuffle
      
      store.each do |question|
        @questions << Question.new(question[0],question[1])
      end
    end
end