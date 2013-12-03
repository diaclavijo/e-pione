class TestMinimental < ActiveRecord::Base


  validates :year, :station, :day_month, :day_week,  :month, :country, :province, :city,  :where, :flat, :objects,  :attention,  :memory,  :pencil,  :repeat, :orders, :eyes, :sentence, :draw, presence: true

  # TODO - rules for accepting each field, the range of integers accepted

  NAME = 'test minimental'

  def score
   ( self.year + self.station + self.day_month + self.day_week +  self.month + self.country + self.province + self.city +  self.where + self.flat + self.objects +  self.attention +  self.memory +  self.pencil +  self.repeat + self.orders + self.eyes + self.sentence + self.draw )
  end



  include IsTest
  include IsCognitiveSymptomatology


end
