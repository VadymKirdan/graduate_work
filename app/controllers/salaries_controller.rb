class SalariesController < ApplicationController
  before_action :set_salary, only: [:show, :edit, :update, :destroy]

  def index
    my_salary()
    @salaries = Salary.all

    @salary_data = []

    @salaries.each do |salary|
      @salary_data.push({
        :label => salary.user.first_name + " " + salary.user.last_name,
        :value => salary.current_balance
      })
    end

   @chart = Fusioncharts::Chart.new({
  :height => 400,
  :width => 1140,
  :id => 'chart',
  :type => 'column2d',
  :renderAt => 'chart-container',
  :dataSource => {
    :chart => {
      :caption => "Current Users Balance",
      :xAxisName => "Users",
      :yAxisName => "Value",
      :numberPrefix => "$",
      :paletteColors => "#0075c2",
      :bgColor => "#ffffff",
      :borderAlpha => "20",
      :canvasBorderAlpha => "0",
      :usePlotGradientColor => "0",
      :plotBorderAlpha => "10",
      :placevaluesInside => "1",
      :rotatevalues => "1",
      :valueFontColor => "#ffffff",
      :showXAxisLine => "1",
      :xAxisLineColor => "#999999",
      :divlineColor => "#999999",
      :divLineDashed => "1",
      :showAlternateHGridColor => "0",
      :subcaptionFontBold => "0",
      :subcaptionFontSize => "14"
    },
    :data => @salary_data
  }
})

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
    @salary.total_balance = 0

    @salary_paid_reports = @salary.user.reports.where("paid = ?", false)
    @salary_paid_reports.each do |report| 
      if report.total_time 
         @salary.current_balance += report.total_time 
      else 
         @salary.current_balance += 0 
      end 
    end

    @salary_unpaid_reports = @salary.user.reports.where("paid = ?", true)
    @salary_unpaid_reports.each do |report| 
      if report.total_time 
         @salary.total_balance += report.total_time 
      else 
         @salary.total_balance += 0 
      end 
    end

    @salary.current_balance = (@salary.current_balance * @salary.user.rank.counter).round(2)
    @salary.total_balance = (@salary.total_balance * @salary.user.rank.counter).round(2)
    @salary.save
  end

  def submit_salary
    @salary = Salary.where("id = ?", params[:salary_id]).first
    @salary_user = @salary.user_id
    @salary_user_reports = Report.where("user_id = ?", @salary_user)
    @user_unpaid_reports = @salary_user_reports.where("paid = ?", false)
    @user_unpaid_reports.each do |report|
      report.paid = true
      report.save
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary
      @salary = Salary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_params
      params.require(:salary).permit(:current_balance, :total_balance, :user_id, :paid)
    end
end
