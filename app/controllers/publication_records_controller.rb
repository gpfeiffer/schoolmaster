class PublicationRecordsController < ApplicationController
  # GET /publication_records
  # GET /publication_records.json
  def index
    @publication_records = PublicationRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @publication_records }
    end
  end

  # GET /publication_records/1
  # GET /publication_records/1.json
  def show
    @publication_record = PublicationRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @publication_record }
    end
  end

  # GET /publication_records/new
  # GET /publication_records/new.json
  def new
    @publication_record = PublicationRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @publication_record }
    end
  end

  # GET /publication_records/1/edit
  def edit
    @publication_record = PublicationRecord.find(params[:id])
  end

  # POST /publication_records
  # POST /publication_records.json
  def create
    @publication_record = PublicationRecord.new(params[:publication_record])

    respond_to do |format|
      if @publication_record.save
        format.html { redirect_to @publication_record, :notice => 'Publication record was successfully created.' }
        format.json { render :json => @publication_record, :status => :created, :location => @publication_record }
      else
        format.html { render :action => "new" }
        format.json { render :json => @publication_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publication_records/1
  # PUT /publication_records/1.json
  def update
    @publication_record = PublicationRecord.find(params[:id])

    respond_to do |format|
      if @publication_record.update_attributes(params[:publication_record])
        format.html { redirect_to @publication_record, :notice => 'Publication record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @publication_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_records/1
  # DELETE /publication_records/1.json
  def destroy
    @publication_record = PublicationRecord.find(params[:id])
    @publication_record.destroy

    respond_to do |format|
      format.html { redirect_to publication_records_url }
      format.json { head :no_content }
    end
  end
end
