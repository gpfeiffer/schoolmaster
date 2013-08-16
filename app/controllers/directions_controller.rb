class DirectionsController < ApplicationController
  load_and_authorize_resource

  # GET /directions
  # GET /directions.json
  def index
    @programme = params[:programme]
    @directions_by_programme = @directions.group_by { |x| x.project.author.programme }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directions }
    end
  end

  # GET /directions/1
  # GET /directions/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @direction }
    end
  end

  # GET /directions/new
  # GET /directions/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @direction }
    end
  end

  # GET /directions/1/edit
  def edit
  end

  # POST /directions
  # POST /directions.json
  def create
    respond_to do |format|
      if @direction.save
        format.html { redirect_to @direction, notice: 'Direction was successfully created.' }
        format.json { render json: @direction, status: :created, location: @direction }
      else
        format.html { render action: "new" }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directions/1
  # PUT /directions/1.json
  def update
    respond_to do |format|
      if @direction.update_attributes(params[:direction])
        format.html { redirect_to @direction, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy

    respond_to do |format|
      format.html { redirect_to directions_url }
      format.json { head :no_content }
    end
  end
end
