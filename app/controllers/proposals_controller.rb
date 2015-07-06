class ProposalsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create, :show]

  # GET /proposals
  # GET /proposals.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.csv
      format.json { render json: @proposals }
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal.accepted = false
    @proposal.enrolment = Enrolment.find(params[:enrolment_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal.enrolment, notice: 'Proposal was successfully created.' }
        format.json { render json: @proposal, status: :created, location: @proposal }
      else
        format.html { render action: "new" }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    respond_to do |format|
      if @proposal.update_attribute(:accepted, true)
        format.html { redirect_to :back, notice: 'Proposal was accepted.' }
      else
        format.html { redirect_to :back, notice: 'Proposal was not accepted.' }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
