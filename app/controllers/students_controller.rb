class StudentsController < ApplicationController
  load_and_authorize_resource

  # GET /students
  # GET /students.json
  def index
    students_by_currency = @students.group_by { |x| x.current? }
    @students = students_by_currency[true] 
    @former_students = students_by_currency[false] 

    respond_to do |format|
      format.html # index.html.erb
      format.text
      format.json { render :json => @students }
      format.xls { send_data Student.to_xls, content_type: 'application/vnd.ms-excel' }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @students = Student.all.select { |x| x.current? }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student.photo_url = "photo.png"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
