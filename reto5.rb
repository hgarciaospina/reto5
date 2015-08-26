require_relative 'store_question'

class Reto5
  attr_reader :store_question

  def initialize(store_question)
    @store_question = store_question
  end

  def start
    puts "\tBienvenido a reto 5,"
         "\tPara jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"

    good_points = 0
    bad_points = 0

    number_of_questions = @store_question.length
    question = @store_question.take!
    while question != nil  && bad_points < number_of_questions*0.5
      print "\n\tDefinición: #{question}? "  
      answer = gets.chomp

      if question.is_valid?(answer)
        good_points += 1
        puts "\tCorrecto!"
        question = @store_question.take!
      else
        bad_points += 1
        puts "\tIncorrecto!, Trata de nuevo"
      end
    end
    
    puts good_points == number_of_questions ? "\n\tFelicitaciones #{good_points}/#{number_of_questions} !!" : "\n\tSigue intentando #{good_points}/#{number_of_questions}, lo lograras :D."
  end
end

reto_5 = Reto5.new(StoreQuestion.new)
reto_5.start
