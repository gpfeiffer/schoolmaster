class TeachingsController < ApplicationController
  # GET /teachings
  # GET /teachings.json
  def index
    @teachings = Teaching.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachings }
    end
  end

  # GET /teachings/1
  # GET /teachings/1.json
  def show
    @teaching = Teaching.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teaching }
    end
  end

  # GET /teachings/new
  # GET /teachings/new.json
  def new
    @teaching = Teaching.new
    @teaching.course_id = params[:course_id]
    @teaching.year = 2014
    @teaching.hours = 2

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teaching }
    end
  end

  # GET /teachings/1/edit
  def edit
    @teaching = Teaching.find(params[:id])
  end

  # POST /teachings
  # POST /teachings.json
  def create
    @teaching = Teaching.new(params[:teaching])

    respond_to do |format|
      if @teaching.save
        format.html { redirect_to @teaching.course, notice: 'Teaching was successfully created.' }
        format.json { render json: @teaching, status: :created, location: @teaching }
      else
        format.html { render action: "new" }
        format.json { render json: @teaching.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachings/1
  # PUT /teachings/1.json
  def update
    @teaching = Teaching.find(params[:id])

    respond_to do |format|
      if @teaching.update_attributes(params[:teaching])
        format.html { redirect_to @teaching.course, notice: 'Teaching was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teaching.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachings/1
  # DELETE /teachings/1.json
  def destroy
    @teaching = Teaching.find(params[:id])
    @teaching.destroy

    respond_to do |format|
      format.html { redirect_to teachings_url }
      format.json { head :no_content }
    end
  end
end
