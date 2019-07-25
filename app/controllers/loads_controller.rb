class LoadsController < ApplicationController
  load_and_authorize_resource

  # GET /loads
  # GET /loads.json
  def index
    @loads = @loads.group_by(&:genuine?)[true]
    @loads_by_date = @loads.group_by(&:date)
    # @date = params[:date] || @loads_by_date.keys.sort.last
    @date = params[:date] || 2020
    @loads = @loads_by_date[@date.to_i]
    @title = "Timetable"
#    @title = "Provisional #{@title}" if @date.to_i > 2019

    respond_to do |format|
      format.html # index.html.erb
      format.csv { send_data Load.to_csv(@loads) }
      format.json { render json: @loads }
      format.xls { send_data Load.to_xls(@loads), content_type: 'application/vnd.ms-excel' }
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
    @atom = Atom.find(params[:atom_id])
    @load.atom_id = @atom.id

    # copy default values from atom
    @load.semester = @atom.semester
    @load.hours = @atom.hours

    # set a default date and weeks
    @load.date = 2020  # FIXME: make this date automatic
    @load.weeks = "1-12"

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
