class BondsController < ApplicationController
  # GET /bonds
  # GET /bonds.json
  def index
    @bonds = Bond.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bonds }
    end
  end

  # GET /bonds/1
  # GET /bonds/1.json
  def show
    @bond = Bond.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bond }
    end
  end

  # GET /bonds/new
  # GET /bonds/new.json
  def new
    @bond = Bond.new
    @bond.molecule = Molecule.find(params[:molecule_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bond }
    end
  end

  # GET /bonds/1/edit
  def edit
    @bond = Bond.find(params[:id])
  end

  # POST /bonds
  # POST /bonds.json
  def create
    @bond = Bond.new(params[:bond])

    respond_to do |format|
      if @bond.save
        format.html { redirect_to @bond.molecule, notice: 'Bond was successfully created.' }
        format.json { render json: @bond, status: :created, location: @bond }
      else
        format.html { render action: "new" }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bonds/1
  # PUT /bonds/1.json
  def update
    @bond = Bond.find(params[:id])

    respond_to do |format|
      if @bond.update_attributes(params[:bond])
        format.html { redirect_to @bond.molecule, notice: 'Bond was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonds/1
  # DELETE /bonds/1.json
  def destroy
    @bond = Bond.find(params[:id])
    @bond.destroy

    respond_to do |format|
      format.html { redirect_to bonds_url }
      format.json { head :no_content }
    end
  end
end
