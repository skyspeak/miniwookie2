class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  layout "homelayout"
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @jobs1 = Job.find_all_by_stage('Stage1')
    @jobs2 = Job.find_all_by_stage('Stage2')
    @jobs3 = Job.find_all_by_stage('Stage3')
    @jobs4 = Job.find_all_by_stage('Stage4')
    
    @stages = []
   @members_count= Job.all.count
   @members1 =  Job.find_all_by_stage('Stage1').count
   @members2 =  Job.find_all_by_stage('Stage2').count
   @members3 =  Job.find_all_by_stage('Stage3').count
   @members4 =  Job.find_all_by_stage('Stage4').count

   @members = []
   @wait_times=[]
   @wait_times1=0
   @wait_times2=0
   @wait_times3=0
   @wait_times4=0
    @average_sec1 = 0
    @average_sec2 = 0
    @average_sec3 = 0
    @average_sec4 = 0
    
    @jobs1.each do |m|
       @wait_times1 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec1 = @average_sec1 + @wait_times1
    end
    
    @average1 = @average_sec1 / @members1
    
    @jobs2.each do |m|
        @wait_times2 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec2 += @wait_times2
    end
    @average2 = @average_sec2 / @members2
    
    @jobs3.each do |m|
       @wait_times3 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec3 += @wait_times3
    end
    @average3 = @average_sec3 / @members3
    
    @jobs4.each do |m|
       @wait_times4 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec4 += @wait_times4
    end
    @average4 = @average_sec4 / @members4
    
    @jobs.each do |m|
      @members << m.name
	  @stages << m.stage
	end
	
	  @wait_times = [(@average1 / 30).round , (@average2 / 30).round , (@average3 / 30).round ,  (@average4 / 30).round]
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @jobs = Job.all
    @jobs1 = Job.find_all_by_stage('Stage1')
    @jobs2 = Job.find_all_by_stage('Stage2')
    @jobs3 = Job.find_all_by_stage('Stage3')
    @jobs4 = Job.find_all_by_stage('Stage4')
    
    @stages = []
   @members_count= Job.all.count
   @members1 =  Job.find_all_by_stage('Stage1').count
   @members2 =  Job.find_all_by_stage('Stage2').count
   @members3 =  Job.find_all_by_stage('Stage3').count
   @members4 =  Job.find_all_by_stage('Stage4').count

   @members = []
   @wait_times=[]
   @wait_times1=0
   @wait_times2=0
   @wait_times3=0
   @wait_times4=0
    @average_sec1 = 0
    @average_sec2 = 0
    @average_sec3 = 0
    @average_sec4 = 0
    
    @jobs1.each do |m|
       @wait_times1 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec1 = @average_sec1 + @wait_times1
    end
    if @members1 > 0
      @average1 = @average_sec1 / @members1
    else
      @average1 = 0
    end
    
    @jobs2.each do |m|
        @wait_times2 = (DateTime.now.to_date - m.start_date).to_i
        @average_sec2 += @wait_times2
    end
    if @members2 > 0
      @average2 = @average_sec2 / @members2
    else
      @average2 = 0
    end
    
    @jobs3.each do |m|
       @wait_times3 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec3 += @wait_times3
    end
    if @members3 > 0
      @average3 = @average_sec3 / @members3
    else
      @average3 = 0
    end
    
    @jobs4.each do |m|
       @wait_times4 = (DateTime.now.to_date - m.start_date).to_i
       @average_sec4 += @wait_times4
    end
    if @members4 > 0
      @average4 = @average_sec4 / @members4
    else
      @average4 = 0
    end
    
    @jobs.each do |m|
      @members << m.name
	  @stages << m.stage
	end
	
	  @wait_times = [(@average1 / 7).round , (@average2 / 7).round , (@average3 / 7).round ,  (@average4 / 7).round]
	  
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
        format.html { redirect_to '/', notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
        format.mobile { redirect_to '/', notice: 'Member was successfully created.' }
      else
        format.html { render action: 'new' }
        format.mobile { render action: 'new'}
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  
  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Member was successfully updated.' }
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
  def aboutus
  
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :category,:country, :stage, :start_date,:end_date)
    end
end
