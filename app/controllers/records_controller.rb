class RecordsController < ApplicationController
  load_and_authorize_resource

  # GET /records
  # GET /records.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>  @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record.academic = Academic.find(params[:academic_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @record }
    end
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    respond_to do |format|
      if @record.save
        format.html { redirect_to @record.academic, :notice =>  'Record was successfully created.' }
        format.json { render :json =>  @record, :status =>  :created, :location => @record }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @record.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @record.academic, :notice =>  'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @record.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to @record.academic, :notice =>  'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
