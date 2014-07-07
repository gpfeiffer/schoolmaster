class InstancesController < ApplicationController
  load_and_authorize_resource

  # GET /instances
  # GET /instances.json
  def index
    @date = params[:date] || 2015

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instances }
    end
  end

  # GET /instances/1
  # GET /instances/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instance }
    end
  end

  # GET /instances/new
  # GET /instances/new.json
  def new
    @instance.atom = Atom.find(params[:atom_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instance }
    end
  end

  # GET /instances/1/edit
  def edit
  end

  # POST /instances
  # POST /instances.json
  def create
    respond_to do |format|
      if @instance.save
        format.html { redirect_to @instance.atom, notice: 'Instance was successfully created.' }
        format.json { render json: @instance, status: :created, location: @instance }
      else
        format.html { render action: "new" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /instances/1
  # PUT /instances/1.json
  def update
    respond_to do |format|
      if @instance.update_attributes(params[:instance])
        format.html { redirect_to @instance.atom, notice: 'Instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @instance.destroy

    respond_to do |format|
      format.html { redirect_to @instance.atom }
      format.json { head :no_content }
    end
  end
end
