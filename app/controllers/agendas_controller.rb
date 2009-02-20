class AgendasController < ApplicationController
  before_filter :find_agenda, :only => [:show, :edit, :update, :destroy]

  # GET /agendas
  # GET /agendas.atom
  def index
    @agendas = Agenda.find(:all, :order => "empresa ASC")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /agendas/1
  # GET /agendas/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agenda }
    end
  end


  # GET /agendas/new
  # GET /agendas/new.xml
  def new
    @agenda = Agenda.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agenda }
    end
  end

  # GET /agendas/1/edit
  def edit   
  end

  # POST /agendas
  # POST /agendas.xml
  def create
    @agenda = Agenda.new(params[:agenda])

    respond_to do |format|
      if @agenda.save
        flash[:notice] = 'Item foi criada com sucesso.'
        format.html { redirect_to(@agenda) }
        format.xml  { render :xml => @agenda, :status => :created, :location => @agenda }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agendas/1
  # PUT /agendas/1.xml
  def update

    respond_to do |format|
      if @agenda.update_attributes(params[:agenda])
        flash[:notice] = 'Item foi atualizado com sucesso.'
        format.html { redirect_to(@agenda) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agenda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.xml
  def destroy   
    @agenda.destroy

    respond_to do |format|
      format.html { redirect_to(agendas_url) }
      format.xml  { head :ok }
    end
  end


  def search
    if request.post? # testa a postagem do formulário de busca
      @searchkey = params[:search]
      if @searchkey.blank?
        flash[:error] = "Você não digitou chave para a Busca."
      else
        @search = Agenda.find(:all, :conditions=>['empresa LIKE ?', "%#{params[:search]}%"])        
        respond_to do |format|
          format.html  #search.html.erb
        end
      end
    end
  end


  private
    def find_agenda
      @agenda = Agenda.find(params[:id])
    end

end
