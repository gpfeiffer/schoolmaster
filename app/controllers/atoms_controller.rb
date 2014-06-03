class AtomsController < ApplicationController
  # GET /atoms
  # GET /atoms.json
  def index
    @atoms = Atom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atoms }
    end
  end

  # GET /atoms/1
  # GET /atoms/1.json
  def show
    @atom = Atom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atom }
    end
  end

  # GET /atoms/new
  # GET /atoms/new.json
  def new
    @atom = Atom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atom }
    end
  end

  # GET /atoms/1/edit
  def edit
    @atom = Atom.find(params[:id])
  end

  # POST /atoms
  # POST /atoms.json
  def create
    @atom = Atom.new(params[:atom])

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
    @atom = Atom.find(params[:id])

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
    @atom = Atom.find(params[:id])
    @atom.destroy

    respond_to do |format|
      format.html { redirect_to atoms_url }
      format.json { head :no_content }
    end
  end
end
