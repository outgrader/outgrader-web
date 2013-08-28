class BannersController < ApplicationController
  before_filter :authenticate_manager!
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :add]

  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.all

  end

  # GET /banners/1
  # GET /banners/1.json
  def show
  end

  # GET /banners/new
  def new
    @banner = Banner.new
    @campaign = Campaign.where(:id => params[:campaign_id]).first

    @this_customer_campaigns = Campaign.where(:customer_id => params[:customer_id])

    @this_customer_banners = []
    @this_customer_campaigns.each do |campaign|
      @this_customer_banners += campaign.Banners.all
    end
    @this_customer_banners.compact
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  # POST /banners.json
  def create
    @campaign = Campaign.where(:id => params[:campaign_id]).first
    @banner = @campaign.Banners.new(banner_params)
    @banner.customer_id = @campaign.customer_id

    respond_to do |format|
      if @banner.save
        @campaign.Banners << @banner
        format.html { redirect_to customer_campaign_path(params[:customer_id], params[:campaign_id]), notice: 'Banner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @banner }
      else
        format.html { render action: 'new' }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banners/1
  # PATCH/PUT /banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @campaign = Campaign.where(:id => params[:campaign_id]).first
    @campaign.Banners << @banner
    redirect_to customer_campaign_path(params[:customer_id], params[:campaign_id]), notice: 'Banner was successfully added.'
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy

    if @banner.Campaigns.all.count <= 1
      @banner.destroy
    else
      @campaign = Campaign.where(:id => params[:campaign_id]).first
      @campaign.Banners.delete(@banner)
    end

    respond_to do |format|
      format.html { redirect_to customer_campaign_path(params[:customer_id], params[:campaign_id]) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_banner
    @banner = Banner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def banner_params
    params.require(:banner).permit(:url, :size_x, :size_y)
  end
end
