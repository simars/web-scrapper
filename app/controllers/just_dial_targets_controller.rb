class JustDialTargetsController < ApplicationController
  # GET /just_dial_targets
  # GET /targets.json
  def index
    @targets = JustDialTarget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @targets }
    end
  end

  # GET /just_dial_targets/1
  # GET /just_dial_targets/1.json
  def show
    @target = JustDialTarget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @target }
    end
  end

  # GET /just_dial_targets/new
  # GET /just_dial_targets/new.json
  def new
    @target = JustDialTarget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target }
    end
  end

  # GET /just_dial_targets/1/edit
  def edit
    @target = JustDialTarget.find(params[:id])
  end

  # POST /just_dial_targets
  # POST /just_dial_targets.json
  def create
    @target = JustDialTarget.new(params[:target])
    @target.url = params[:url]
    @target.start_page = params[:start_page]
    @target.end_page = params[:end_page]
    respond_to do |format|
      if @target.save
        format.html { redirect_to @target, notice: 'Target was successfully created.' }
        format.json { render json: @target, status: :created, location: @target }
      else
        format.html { render action: "new" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /just_dial_targets/1
  # PUT /just_dial_targets/1.json
  def update
    @target = JustDialTarget.find(params[:id])
    @target.url = params[:url]
    @target.start_page = params[:start_page]
    @target.end_page = params[:end_page]
    respond_to do |format|
      if @target.update_attributes(params[:target])
        format.html { redirect_to @target, notice: 'Target was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /just_dial_targets/1
  # DELETE /just_dial_targets/1.json
  def destroy
    @target = JustDialTarget.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to just_dial_targets_url }
      format.json { head :ok }
    end
  end
end
