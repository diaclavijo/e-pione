class FototestsController < ApplicationControllerSigned

  def new

  end

  def create
    @fototest = Fototest.new params['CadenaFototest']
    @edad = params['Edad']
    @fecha = params['Fecha']
  end


  private
    class Fototest
      def initialize cadena; @cadena = cadena; end

      def cartas1;   @cadena[0].to_i; end;
      def coche1;   @cadena[1].to_i; end;
      def pera1;   @cadena[2].to_i; end;
      def trompeta1;   @cadena[3].to_i; end;
      def zapatos1;   @cadena[4].to_i; end;
      def cuchara1;   @cadena[5].to_i; end;
      def cartas2;   @cadena[6].to_i; end;
      def coche2;   @cadena[7].to_i; end;
      def pera2;   @cadena[8].to_i; end;
      def trompeta2;   @cadena[9].to_i; end;
      def zapatos2;   @cadena[10].to_i; end;
      def cuchara2;   @cadena[11].to_i; end;
      def cartas3;   @cadena[12].to_i; end;
      def coche3;   @cadena[13].to_i; end;
      def pera3;   @cadena[14].to_i; end;
      def trompeta3;   @cadena[15].to_i; end;
      def zapatos3;   @cadena[16].to_i; end;
      def cuchara3;   @cadena[17].to_i; end;
      def totalHombres;   @cadena[18..19].to_i; end;
      def totalMujeres;   @cadena[20..21].to_i; end;

      def total1
        cartas1 + coche1 + pera1 + trompeta1 + zapatos1 + cuchara1
      end

      def total2
        cartas2 + coche2 + pera2 + trompeta2 + zapatos2 + cuchara2
      end

      def total3
        cartas3 + coche3 + pera3 + trompeta3 + zapatos3 + cuchara3
      end

      def total
        total1 + total2 + total3 + totalHombres + totalMujeres
      end

    end
end
