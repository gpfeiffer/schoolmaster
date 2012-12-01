class SupervisionsController < ApplicationController
  load_and_authorize_resource

  # GET /supervisions
  # GET /supervisions.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @supervisions }
    end
  end

  # GET /supervisions/1
  # GET /supervisions/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @supervision }
    end
  end

  # GET /supervisions/new
  # GET /supervisions/new.json
  def new
    @supervision.student = Student.find(params[:student_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @supervision }
    end
  end

  # GET /supervisions/1/edit
  def edit
  end

  # POST /supervisions
  # POST /supervisions.json
  def create
    respond_to do |format|
      if @supervision.save
        format.html { redirect_to @supervision.student, :notice => 'Supervision was successfully created.' }
        format.json { render :json => @supervision, :status => :created, :location => @supervision }
      else
        format.html { render :action => "new" }
        format.json { render :json => @supervision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supervisions/1
  # PUT /supervisions/1.json
  def update
    respond_to do |format|
      if @supervision.update_attributes(params[:supervision])
        format.html { redirect_to @supervision.student, :notice => 'Supervision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @supervision.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisions/1
  # DELETE /supervisions/1.json
  def destroy
    @supervision.destroy

    respond_to do |format|
      format.html { redirect_to @supervision.student }
      format.json { head :no_content }
    end
  end
end
