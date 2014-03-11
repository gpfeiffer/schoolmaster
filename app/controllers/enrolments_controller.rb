class EnrolmentsController < ApplicationController
  # GET /enrolments
  # GET /enrolments.json
  def index
    @enrolments = Enrolment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enrolments }
    end
  end

  # GET /enrolments/1
  # GET /enrolments/1.json
  def show
    @enrolment = Enrolment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enrolment }
    end
  end

  # GET /enrolments/new
  # GET /enrolments/new.json
  def new
    @enrolment = Enrolment.new
    @enrolment.user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enrolment }
    end
  end

  # GET /enrolments/1/edit
  def edit
    @enrolment = Enrolment.find(params[:id])
  end

  # POST /enrolments
  # POST /enrolments.json
  def create
    @enrolment = Enrolment.new(params[:enrolment])

    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully created.' }
        format.json { render json: @enrolment, status: :created, location: @enrolment }
      else
        format.html { render action: "new" }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enrolments/1
  # PUT /enrolments/1.json
  def update
    @enrolment = Enrolment.find(params[:id])

    respond_to do |format|
      if @enrolment.update_attributes(params[:enrolment])
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1
  # DELETE /enrolments/1.json
  def destroy
    @enrolment = Enrolment.find(params[:id])
    @enrolment.destroy

    respond_to do |format|
      format.html { redirect_to enrolments_url }
      format.json { head :no_content }
    end
  end
end
