require 'rspec/autorun'
require_relative '../components/lanzamiento'


RSpec.describe Lanzamiento do
  let(:tiro){Lanzamiento.new()}
  it  'existe'  do
    expect(tiro).to be_a Class
  end
  it 'inicie el puntaje en cero' do    
    expect(tiro.puntaje).to eql 0
  end


  
end