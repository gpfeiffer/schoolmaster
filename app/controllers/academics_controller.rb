class AcademicsController < ApplicationController
  load_and_authorize_resource

  # GET /academics
  # GET /academics.json
  def index
    @schools = School.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @academics }
    end
  end

  # GET /academics/1
  # GET /academics/1.json
  def show
    @schools = School.all
    @active_supervisions = @academic.active_supervisions
    @complete_supervisions = @academic.complete_supervisions
    @active_committees = @academic.active_committees 
    @active_directions = @academic.active_directions
    @active_examinations = @academic.active_examinations

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @academic }
    end
  end

  # GET /academics/new
  # GET /academics/new.json
  def new
    @academic.image_url = "photo.png"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @academic }
    end
  end

  # GET /academics/1/edit
  def edit
  end

  # POST /academics
  # POST /academics.json
  def create
    respond_to do |format|
      if @academic.save
        format.html { redirect_to @academic, :notice => 'Academic was successfully created.' }
        format.json { render :json => @academic, :status => :created, :location => @academic }
      else
        format.html { render :action => "new" }
        format.json { render :json => @academic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /academics/1
  # PUT /academics/1.json
  def update
    respond_to do |format|
      if @academic.update_attributes(params[:academic])
        format.html { redirect_to @academic, :notice => 'Academic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @academic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /academics/1
  # DELETE /academics/1.json
  def destroy
    @academic.destroy

    respond_to do |format|
      format.html { redirect_to academics_url }
      format.json { head :no_content }
    end
  end
end
