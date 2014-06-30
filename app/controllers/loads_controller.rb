class LoadsController < ApplicationController
  load_and_authorize_resource

  # GET /loads
  # GET /loads.json
  def index
    @loads_by_date = @loads.group_by(&:date)
    @date = params[:date] || @loads_by_date.keys.sort.last
    @loads = @loads_by_date[@date.to_i]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loads }
    end
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @load }
    end
  end

  # GET /loads/new
  # GET /loads/new.json
  def new
    @load.atom_id = params[:atom_id]
    @load.date = 2015

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @load }
    end
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  # POST /loads.json
  def create
    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render json: @load, status: :created, location: @load }
      else
        format.html { render action: "new" }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loads/1
  # PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update_attributes(params[:load])
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy

    respond_to do |format|
      format.html { redirect_to @load.atom }
      format.json { head :no_content }
    end
  end
end
