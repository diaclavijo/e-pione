class FototestsController < ApplicationControllerSigned

  def new
    @fototest = Fototest.new
  end

  def create
    @fototest = current_physician.fototests.new fototest_params
    if @fototest.valid_siad_exec?
      siad_params = fototest_params.to_hash.symbolize_keys
      siad_params.delete :education_select
      @fototest.diagnosis, @fototest.probability = fototest_siad edad: @fototest.age,
                                                                 sexo: @fototest.gender ,
                                                                 rl: @fototest.rl, rf: @fototest.rf, memoria: @fototest.memoria,
                                                                 hombres: @fototest.total_hombres, mujeres: @fototest.total_mujeres,
                                                                 fluidez: @fototest.fluidez, fototest: @fototest.total,
                                                                 estudio: @fototest.education
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

  def help

  end

  private
    def fototest_siad (
        edad: nil, sexo: nil,
        rl: nil, rf: nil, memoria: nil, hombres: nil, mujeres: nil, fluidez: nil,
        fototest: nil,
        estudio: nil
    )

      python_script = 'python3.4 /opt/SIAD/fototest.py'
      return nil unless edad && sexo && # all the args are mandatory
          rl && rf && memoria && hombres && mujeres && fluidez &&
          fototest && estudio
      # python3.4 SIAD/fototest.py SEXO:0 EDAD:50 RL:8 RF:2 MEMORIA:10 HOMBRES:8 MUJERES:8 FLUIDEZ:16 FOTOTEST:25 ESTUDIO:10
      result = `#{python_script} SEXO:#{sexo} EDAD:#{edad} RL:#{rl} RF:#{rf} MEMORIA:#{memoria} HOMBRES:#{hombres} MUJERES:#{mujeres} FLUIDEZ:#{fluidez} FOTOTEST:#{fototest} ESTUDIO:#{estudio} `
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
      params.require(:fototest).permit(:age, :education, :gender,
                                       :cartas1, :coche1, :pera1, :trompeta1,
                                       :zapatos1, :cuchara1, :cartas2, :coche2,
                                       :pera2, :trompeta2, :zapatos2, :cuchara2,
                                       :cartas3, :coche3, :pera3, :trompeta3,
                                       :zapatos3, :cuchara3, :total_hombres,
                                       :total_mujeres)
    end

end
