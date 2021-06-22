# frozen_string_literal: true

class Bowling
  def initialize
    @tiros = []
  end

  def tiro(pinos)
    @tiros << pinos
  end

  # Este metodo sirve para rellenar el vector con numeros aleatroios
  # del 1 al 10 pero sin que los pares sobrepasen el 10
  def rellenar_vector
    (1..20).each do |count|
      if count.even?
        puntaje_anterior = @tiros[count - 2]
        num_aleatorio = rand(1..10 - puntaje_anterior)
        @tiros.push(num_aleatorio)
      else
        @tiros.push(rand(10))
      end
    end
  end


  # Este metodo verifica si existe un strike, spare o tiro sencillo
  # y aplica los bonua al resultado
  def score
    result = 0
    tiro_index = 0
    rellenar_vector

    10.times do
      if strike?(tiro_index)
        result += strike_Score(tiro_index)
        tiro_index += 1
      elsif spare?(tiro_index)

        result += spare_score(tiro_index)
        tiro_index += 2
      else
        result += cuadro_score(tiro_index)
        tiro_index += 2
      end
    end
    result
  end
  
  #Este metodo veridica si existe un strike o no
  def strike? tiro_index
    @tiros[tiro_index] == 10
  end

  def strike_score tiro_index
    @tiros[tiro_index] + @tiros[tiro_index + 1] + @tiros[tiro_index + 2]
  end
  
  # Metodo valida si se realiza un "Spare"
  def spare? tiro_index
    @tiros[tiro_index] + @tiros[tiro_index + 1] == 10
  end
  
  # Metodo realiza la sumatoria en caso de realizar un "Spare"
  def spare_score tiro_index
    @tiros.push(rand(1..10)) if tiro_index == 18
    actual = 0
    actual += @tiros[tiro_index]
    actual += @tiros[tiro_index + 1]
    actual += @tiros[tiro_index + 2]
    actual
  end
  # Metodo que suma la puntuacion de ambos tiros en caso de que sean por defecto
  def cuadro_score tiro_index
    @tiros[tiro_index] + @tiros[tiro_index + 1]
  end
  
  # Metodo comprueba tiro y lo imprime
  def prints
    tiros = @tiros
    tiros.each do |tiro_puntaje|
      puts "Puntaje por tiro: #{tiro_puntaje}"
    end
  end
end

prueba = Bowling.new
prueba.score
prueba.prints
puts "Puntaje final: #{prueba.score}"
