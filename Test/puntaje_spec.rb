# frozen_string_literal: true

require 'rspec'
require_relative '../puntaje'

RSpec.describe 'Bowling game logica' do
  before do
    @juego = Bowling.new
  end

  it 'No se relizan puntos en todos los tiros' do
    20.times { @juego.tiro(0) }
    expect(@juego.score).to eql(0)
  end

  it 'Se tiran todas las veces (20 tiros)' do
    20.times { @juego.tiro(1) }
    expect(@juego.score).to eql(20)
  end

  it 'Se reliza un spare' do
    @juego.tiro(5)
    @juego.tiro(5)
    @juego.tiro(3)
    17.times { @juego.tiro(0) }
    expect(@juego.score).to eql(16)
  end

  it 'Se tira un strike' do
    @juego.tiro(10)
    @juego.tiro(3)
    @juego.tiro(4)
    16.times { @juego.tiro(0) }
    expect(@juego.score).to eql(24)
  end

  it ' Todos los tiros son perfectos ' do
    12.times { @juego.tiro(10) }
    expect(@juego.score).to eql(300)
  end
end
