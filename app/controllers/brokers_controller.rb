class BrokersController < ApplicationController
  # GET /brokers
  # GET /brokers.json
  def index
    @brokers = Broker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brokers }
    end
  end

  # GET /brokers/1
  # GET /brokers/1.json
  def show
    @broker = Broker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @broker }
    end
  end

  # GET /brokers/new
  # GET /brokers/new.json
  def new
    @broker = Broker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @broker }
    end
  end

  # GET /brokers/1/edit
  def edit
    @broker = Broker.find(params[:id])
  end

  # POST /brokers
  # POST /brokers.json
  def create
    @broker = Broker.new(params[:broker])

    respond_to do |format|
      if @broker.save
        format.html { redirect_to @broker, notice: 'Broker was successfully created.' }
        format.json { render json: @broker, status: :created, location: @broker }
      else
        format.html { render action: "new" }
        format.json { render json: @broker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brokers/1
  # PUT /brokers/1.json
  def update
    @broker = Broker.find(params[:id])

    respond_to do |format|
      if @broker.update_attributes(params[:broker])
        format.html { redirect_to @broker, notice: 'Broker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @broker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brokers/1
  # DELETE /brokers/1.json
  def destroy
    @broker = Broker.find(params[:id])
    @broker.destroy

    respond_to do |format|
      format.html { redirect_to brokers_url }
      format.json { head :no_content }
    end
  end
end
