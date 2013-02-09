class ExaminationsController < ApplicationController
  load_and_authorize_resource

  # GET /examinations
  # GET /examinations.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @examinations }
    end
  end

  # GET /examinations/1
  # GET /examinations/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @examination }
    end
  end

  # GET /examinations/new
  # GET /examinations/new.json
  def new
    @examination.project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @examination }
    end
  end

  # GET /examinations/1/edit
  def edit
  end

  # POST /examinations
  # POST /examinations.json
  def create
    respond_to do |format|
      if @examination.save
        format.html { redirect_to @examination.project, notice: 'Examination was successfully created.' }
        format.json { render json: @examination, status: :created, location: @examination }
      else
        format.html { render action: "new" }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /examinations/1
  # PUT /examinations/1.json
  def update
    respond_to do |format|
      if @examination.update_attributes(params[:examination])
        format.html { redirect_to @examination, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examinations/1
  # DELETE /examinations/1.json
  def destroy
    @examination.destroy

    respond_to do |format|
      format.html { redirect_to examinations_url }
      format.json { head :no_content }
    end
  end
end
