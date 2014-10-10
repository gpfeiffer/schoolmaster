class PathwaysController < ApplicationController
  # GET /pathways
  # GET /pathways.json
  def index
    @pathways = Pathway.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pathways }
    end
  end

  # GET /pathways/1
  # GET /pathways/1.json
  def show
    @pathway = Pathway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pathway }
    end
  end

  # GET /pathways/new
  # GET /pathways/new.json
  def new
    @pathway = Pathway.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pathway }
    end
  end

  # GET /pathways/1/edit
  def edit
    @pathway = Pathway.find(params[:id])
  end

  # POST /pathways
  # POST /pathways.json
  def create
    @pathway = Pathway.new(params[:pathway])

    respond_to do |format|
      if @pathway.save
        format.html { redirect_to @pathway, notice: 'Pathway was successfully created.' }
        format.json { render json: @pathway, status: :created, location: @pathway }
      else
        format.html { render action: "new" }
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pathways/1
  # PUT /pathways/1.json
  def update
    @pathway = Pathway.find(params[:id])

    respond_to do |format|
      if @pathway.update_attributes(params[:pathway])
        format.html { redirect_to @pathway, notice: 'Pathway was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pathways/1
  # DELETE /pathways/1.json
  def destroy
    @pathway = Pathway.find(params[:id])
    @pathway.destroy

    respond_to do |format|
      format.html { redirect_to pathways_url }
      format.json { head :no_content }
    end
  end
end
