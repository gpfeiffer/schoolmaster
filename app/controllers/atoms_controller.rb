class AtomsController < ApplicationController
  load_and_authorize_resource

  # GET /atoms
  # GET /atoms.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atoms }
    end
  end

  # GET /atoms/1
  # GET /atoms/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atom }
    end
  end

  # GET /atoms/new
  # GET /atoms/new.json
  def new
    @atom.hours = 24
    @atom.weeks = '1-12'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atom }
    end
  end

  # GET /atoms/1/edit
  def edit
  end

  # POST /atoms
  # POST /atoms.json
  def create
    respond_to do |format|
      if @atom.save
        format.html { redirect_to @atom, notice: 'Atom was successfully created.' }
        format.json { render json: @atom, status: :created, location: @atom }
      else
        format.html { render action: "new" }
        format.json { render json: @atom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atoms/1
  # PUT /atoms/1.json
  def update
    respond_to do |format|
      if @atom.update_attributes(params[:atom])
        format.html { redirect_to @atom, notice: 'Atom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atoms/1
  # DELETE /atoms/1.json
  def destroy
    @atom.destroy

    respond_to do |format|
      format.html { redirect_to atoms_url }
      format.json { head :no_content }
    end
  end
end
