class ReportsController < ApplicationController

  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @current_day_report = Report.where("date = ?", report_params[:date])
    if !@current_day_report.present?
      @report = Report.new(report_params)
      @report.user_id = params[:user_id]
      @report.paid = false
      if @report.day_off == true
        @report.time_start = nil
        @report.time_end = nil
        @report.total_time = 0
      else
        @report.total_time = ((@report.time_end - @report.time_start) / 3600).round(2)
      end
      if @report.total_time < 0
        redirect_to :back, flash: {notice: "Wrong time!!!"}
      else
        if @report.total_time > 8
          @report.total_time = 8
        end
        respond_to do |format|
          if @report.save
            format.html { redirect_to @report, notice: 'Report was successfully created.' }
            format.json { render :show, status: :created, location: @report }
          else
            format.html { render :new }
            format.json { render json: @report.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, error: "An error message for the user" }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    if @report.day_off == true
      @report.time_start = nil
      @report.time_end = nil
      @report.total_time = 0
    else
      @report.total_time = ((@report.time_end - @report.time_start) / 3600).round(2)
    end
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_reports
    @reports = Report.where("user_id = ?", current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:comment, :project_id, :user_id, :day_off, :time_start, :time_end, :date)
    end
end
