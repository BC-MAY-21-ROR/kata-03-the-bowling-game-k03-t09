require 'rspec/autorun'
require_relative '../components/lanzamiento'


RSpec.describe Pantalla do
    it  'existe'  do
      expect(Pantalla).to be_a Class
    end
end

