class SettingsController < ApplicationController
  
  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    respond_to do |format|
      if @setting.save
        format.html { redirect_to @setting, notice: 'Setting successfully added' }
        format.json { render :show, status: :created, location: @setting }
      end
    end
  end
  
  def index
    @settings = Setting.all
  end

  def edit_settings
    @settings = Setting.all
  end

  def update_settings
    params[:settings].each do |id, values|
      setting = Setting.find(id)
      setting.update_attributes(values)
    end
    @settings = Setting.all
    respond_to do |format|
      format.html { redirect_to settings_path, notice: 'Settings successfully updated' }
    end
  end

  private

    def setting_params
      params.require(:settings).permit(:name, :value)
    end
end
