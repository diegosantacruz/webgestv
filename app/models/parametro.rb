class Parametro
  include Mongoid::Document
  field :nombre
  field :comentario
  validates_presence_of :paracomp, message: 'Debe seleccionar un parámetro'
  validates_presence_of :atrcomp, message: 'Debe seleccionar un atributo'
  validates_presence_of :refreshatr, message: 'Debe seleccionar almenos un elemento'
  #persistencia temporal en tanto se acondiciona la lógica
  field :paracomp #parámetro compuesto
  field :atrcomp #atributos de compuesto
  field :refreshatr#atributos filtrados de la seleccion con el variable

  validates_presence_of :nombre
end

