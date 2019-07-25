class CohortsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource

  # GET /cohorts
  # GET /cohorts.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cohorts }
    end
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
    @instances_by_date = @cohort.instances.group_by(&:date)
    @date = params[:date] || 2020
    @instances = @instances_by_date[@date.to_i] || []
    @title = "Timetable"
#    @title = "Provisional #{@title}" if @date.to_i > 2019

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cohort }
    end
  end

  # GET /cohorts/new
  # GET /cohorts/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cohort }
    end
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render json: @cohort, status: :created, location: @cohort }
      else
        format.html { render action: "new" }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cohorts/1
  # PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update_attributes(params[:cohort])
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    @cohort.destroy

    respond_to do |format|
      format.html { redirect_to cohorts_url }
      format.json { head :no_content }
    end
  end
end
