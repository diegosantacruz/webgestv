class ParametrosController < ApplicationController
  # GET /parametros
  # GET /parametros.json
  def index
    #@parametro = Atr.all
    @parametro = NetEle.all
   # @parametro = Hst.search(params[:searchbox])
    @mcrsearch=McrAtr.where(:tipo.all => ['composite'])
    @atributo = Atr.where(:mcr_atr_id => params[:mcr_atr])
    respond_to do |format|

      format.html # index.html.erb
   
    format.json { render json: @parametro }

  end
    # respond_to do |format|
    #  format.html # index.html.erb
     # format.json { render json: @parametros }
    #end
  end
  # GET /parametros/1
  # GET /parametros/1.json
  def show
    #@parametro = Hst.where(:atr_id => $globalb)
    @parametro = Atr.find($globalb)


    @historicos= Hst.where(:atr_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @parametro }
    end
  end

  # GET /parametros/new
  # GET /parametros/new.json
  def new
    @parametros = Atr.all
    @parametro = Parametro.new
    @mcrsearch=McrAtr.where(:tipo.all => ['composite'])
    @atrsearch=Atr.where(:mcr_atr_id => params[:id])
    @updatecond=Hst.where(:atr_id => params[:id]) 
    @refreshatr=Atr.where(:mcr_atr_id => params[:id])
    respond_to do |format|
     format.html # new.html.erb
      format.json { render json: @parametro }
    end
  end

  # GET /parametros/1/edit
  def edit
    @parametro = Parametro.find(params[:id])
       
  end

  # POST /parametros
  # POST /parametros.json
  def create
    
    @parametro = Hst.where(:atr_id => $globalb)
    puts 'Se envio a show lo siguiente'
    puts '/////////'
    puts @parametro.as_json
    puts '/////////'
   # @param_condnls = AtrHst.where(:atr_id => $globalselect)

    #!!!!!!!!!!$globalselect pendiente!

    #@parametro = Parametro.new(params[:parametro])
    #@mcrsearch = McrAtr.where(:tipo.all => ['composite'])
    #@atrsearch = Atr.where(:mcr_atr_id => params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @parametro }
      
      #if @parametro.save
       # format.html { redirect_to @parametro, notice: 'Parametro was successfully created.' }
       # format.json { render json: @parametro, status: :created, location: @parametro }
     # else
        #format.html { render action: "new" }
       # format.json { render json: @parametro.errors, status: :unprocessable_entity }
     # end
    end

    


  end

  # PUT /parametros/1
  # PUT /parametros/1.json
  def update_atr
    @parametro = Parametro.new
    #@nueva=AtrHst.where(:atr_id => params[])
    @atrsearch=Atr.where(:mcr_atr_id => params[:id]) 
    $global = params[:id]
    puts 'El Id del parametro compuesto seleccionado es:'
    puts '/////////'
    puts $global.as_json
    puts '/////////'
      
    render :partial => 'atrsearch', :link => @atrsearch
  end
  def refresh_atr
    @parametro = Parametro.new
    
    #@atrsearch=atr_search(params[:name]) 
    #if params[:action] == "edit" or params[:action] == "update"
      #inc = true
    #end    
    @refreshatr=refreshatr(params[:id])
    $globalb = params[:id]
   # puts '//////////2'
   # puts @atrsearch.as_json
    puts 'El Id del atributo variable seleccionado es:'
    puts '/////////'
    puts $globalb
    puts '/////////'
    
    render :partial => 'refreshatr', :link => @refreshatr
    
  end
    def refreshatr(id)
      #band=Atr.where(:mcr_atr_id => params[:id])
    band=Atr.find(params[:id])
    puts 'Ud selecciono como atributo variable a:'
    puts '//////////'
    puts band.as_json
    puts '/////////'
    atrbusque=Atr.where(:mcr_atr_id => $global)
    #where(:mcr_atr_id => $global) 
    refreshatr=atrbusque.excludes(id: id)#aqui deberia cambiar Atr por el filtro que genero el primer listado...
    refreshatr
    end

  def update_cond
    @parametro = Parametro.new
    #@nueva=AtrHst.where(:atr_id => params[])
    @updatecond=Hst.where(:atr_id => $globalb)
    render :partial => 'updatecond'
  end
end

 
 