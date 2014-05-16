class FototestsController < ApplicationControllerSigned

  def new
    @fototest = Fototest.new
  end

  def create
    @fototest = current_physician.fototests.new fototest_params
    if @fototest.valid_siad_exec?
      @fototest.diagnosis, @fototest.probability = fototest_siad fototest_params
      siad_error = true unless ( @fototest.diagnosis && @fototest.probability )
    end
    respond_to do |format|
      if siad_error
        flash[:alert]= 'Ha habido un error. Por favor contacte a los administradores. '
        format.html { redirect_to new_fototest_path }
      else
        if @fototest.save
          format.html { render 'show'	}
        else
          format.html { render action: 'new' }
        end
      end
    end
  end

  private
    def fototest_siad (
        age: nil, education: nil,
        cartas1: nil, coche1: nil, pera1: nil, trompeta1: nil, zapatos1: nil, cuchara1: nil,
        cartas2: nil, coche2: nil, pera2: nil, trompeta2: nil, zapatos2: nil, cuchara2: nil,
        cartas3: nil, coche3: nil, pera3: nil, trompeta3: nil, zapatos3: nil, cuchara3: nil,
        total_hombres: nil, total_mujeres: nil
    )
      python_script = 'python3 /opt/fototest/fototest.py'
      return nil unless age && education && # all the args are mandatory
          cartas1 && coche1 && pera1 && trompeta1 && zapatos1 && cuchara1 &&
          cartas2 && coche2 && pera2 && trompeta2 && zapatos2 && cuchara2 &&
          cartas3 && coche3 && pera3 && trompeta3 && zapatos3 && cuchara3 &&
          total_hombres && total_mujeres
      result = `#{python_script} age:#{age} educ:#{education} cartas1:#{cartas1} coche1:#{coche1} pera1:#{pera1} trompeta1:#{trompeta1} zapatos1:#{zapatos1} cuchara1:#{cuchara1} cartas2:#{cartas2} coche2:#{coche2} pera2:#{pera2} trompeta2:#{trompeta2} zapatos2:#{zapatos2} cuchara2:#{cuchara2} cartas3:#{cartas3} coche3:#{coche3} pera3:#{pera3} trompeta3:#{trompeta3} zapatos3:#{zapatos3} cuchara3:#{cuchara3}  total_hombres:#{total_hombres} total_mujeres:#{total_mujeres} `
      output_reg = /(\d)\s+(\d+\.\d+)/
      if output_reg.match result
        diagnosis = $1.to_i
        probability = $2.to_f
        [ diagnosis, probability ]
      else
        nil
      end
    end

    def fototest_params
      params.require(:fototest).permit(:age, :education, :education_select,
                                       :cartas1, :coche1, :pera1, :trompeta1,
                                       :zapatos1, :cuchara1, :cartas2, :coche2,
                                       :pera2, :trompeta2, :zapatos2, :cuchara2,
                                       :cartas3, :coche3, :pera3, :trompeta3,
                                       :zapatos3, :cuchara3, :total_hombres,
                                       :total_mujeres)
    end

end
