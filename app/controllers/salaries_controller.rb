class SalariesController < ApplicationController
  before_action :set_salary, only: [:show, :edit, :update, :destroy]

  def index
    @salaries = Salary.all
  end

  def show
  end

  # GET /projects/new
  # def new
  #   @project = Project.new
  # end

  # GET /projects/1/edit
  # def edit
  # end

  # POST /projects
  # POST /projects.json
  # def create
  #   @project = Project.new(project_params)

  #   respond_to do |format|
  #     if @project.save
  #       format.html { redirect_to @project, notice: 'Project was successfully created.' }
  #       format.json { render :show, status: :created, location: @project }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @project.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  # def update
  #   respond_to do |format|
  #     if @project.update(project_params)
  #       format.html { redirect_to @project, notice: 'Project was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @project }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @project.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /projects/1
  # DELETE /projects/1.json
  # def destroy
  #   @project.destroy
  #   respond_to do |format|
  #     format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def my_salary
    @salary = Salary.where("user_id = ?", current_user.id).first
    @salary.current_balance = 0 
    @salary.user.reports.each do |report| 
      if report.total_time 
         @salary.current_balance += report.total_time 
      else 
         @salary.current_balance += 0 
      end 
    end 
    @salary.current_balance = @salary.current_balance.round(2)
    @salary.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary
      @salary = Salary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_params
      params.require(:salary).permit(:current_balance, :total_balance, :user_id)
    end
end
