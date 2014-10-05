class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        # noinspection RailsParamDefResolve
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        # noinspection RailsParamDefResolve
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # noinspection RailsChecklist01
  def import
    # Parse the student data
    student_data = params[:student_data] ? params[:student_data].read : ''

    # TODO: Don't assume first row is a header row. Detect it and skip if it's there.
    row_count    = 0
    Student.transaction do
      student_data.split(/[\r\n]/).each do |row|
        next if row.blank?
        row_count += 1

        # Skip the header row (e.g. first row) in the data
        next if row_count == 1

        student_last, student_first, grade,
          teacher_last, teacher_first, teacher_title,
          father_last, father_first, father_email,
          mother_first, mother_last,
          mother_email = row.split(',')[1..12]

        # Find or create the Student
        student        = load_student(student_first, student_last)
        student.grade  = grade if grade.present?

        # Find or create the teacher
        teacher        = load_teacher(teacher_first, teacher_last)
        teacher.title  = teacher_title if teacher_title.present?

        # Find or create the parents
        parents        = []

        if mother_last.present?
          mother       = load_parent(mother_first, mother_last)
          mother.email = mother_email if mother_email.present?
          parents << mother
        end

        if father_last.present?
          father       = load_parent(father_first, father_last)
          father.email = father_email if father_email.present?
          parents << father
        end

        # Create the Family object if it doesn't exist. Drive it from the parent side.
        # NB: We work under the assumption that a given parent only belongs to one family. If one parent had two
        # children from two different partners, we may get in trouble here.

        if parents.empty?
          # A student *must* have at least one parent!
          redirect_to students_url, notice: "#{student_first} #{student_last} has no parents! Aborting import; no records changed!"
          return
        end

        # @type [Parent]
        first_parent = parents.first

        # @type [Family]
        family       = first_parent.family || first_parent.build_family

        # Wire things up!
        parents.each do |parent|
          # noinspection RubyResolve
          parent.family = family
        end
        student.teacher = teacher
        student.family  = family
        family.parents  = parents

        # Save one and all! We're probably being overly conservative here...
        student.save!
        teacher.save!
        family.save!
        parents.each do |parent|
          parent.save!
        end
      end
    end
    redirect_to students_url, notice: "#{row_count - 1} student records created."
  end

  # @return [Parent]
  def load_parent(mother_first, mother_last)
    find_or_instantiate(Parent, mother_last, mother_first)
  end

  # @return [Student]
  def load_student(student_first, student_last)
    find_or_instantiate(Student, student_last, student_first)
  end

  # @return [Teacher]
  def load_teacher(teacher_first, teacher_last)
    find_or_instantiate(Teacher, teacher_last, teacher_first)
  end

  def search
    # Search for students based on full-names and last-names that start with the search term.

    search_for = "#{params[:term]}%"
    @matches   = Student.where('full_name ilike ? or last_name ilike ?', search_for, search_for).limit(10).order("last_name, first_name").pluck(:full_name)
    render json: @matches
  end

  private

  def find_or_instantiate(klass, last_name, first_name)
    klass.find_by(last_name: last_name, first_name: first_name) ||
      klass.new(last_name: last_name, first_name: first_name)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade)
  end
end
