class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @stages = []
    
   @members1 =  Job.find_all_by_stage('Stage1').count
   @members2 =  Job.find_all_by_stage('Stage2').count
   @members3 =  Job.find_all_by_stage('Stage3').count
   @members4 =  Job.find_all_by_stage('Stage4').count
   @members5=  Job.find_all_by_stage('Stage5').count
   @members6 =  Job.find_all_by_stage('Stage6').count
   @members = []
   @wait_times=[]
	   @jobs.each do |m|
	     @members << m.name
		  @wait_times << ((DateTime.now.to_date - m.date)* 24 * 60 ).to_i
	      @stages << m.stage
	    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @jobs = Job.all
    @stages = []
   @members1 =  Job.find_all_by_stage('Stage1').count
   @members2 =  Job.find_all_by_stage('Stage2').count
   @members3 =  Job.find_all_by_stage('Stage3').count
   @members4 =  Job.find_all_by_stage('Stage4').count
   @members5=  Job.find_all_by_stage('Stage5').count
   @members6 =  Job.find_all_by_stage('Stage6').count
   @members = []
   @wait_times=[]
  
    @jobs.each do |m|
      @members << m.name
	  @stages << m.stage
	  @wait_times << ((DateTime.now.to_date - m.date)* 24 * 60 ).to_i
  end
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
   
    respond_to do |format|
      if @job.save
        @job_email = JobEmail.new(:job_id => @job.id , :email => params[:job][:email])
        @job_email.save!
        format.html { redirect_to '/jobs/new', notice: 'Job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  
  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :category, :stage, :date,:comments)
    end
end
