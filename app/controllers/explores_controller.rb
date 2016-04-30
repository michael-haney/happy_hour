class ExploresController < ApplicationController
  before_action :set_explore, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /explores
  # GET /explores.json
  def index
    @explores = Explore.all
    @hash = Gmaps4rails.build_markers(@explores) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def lodo
    @lodo = Explore.where(location: 'Lodo')
    @hash = Gmaps4rails.build_markers(@lodo) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def lohi
    @lohi = Explore.where(location: 'Lohi')
    @hash = Gmaps4rails.build_markers(@lohi) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def rino
    @rino = Explore.where(location: 'Rino')
    @hash = Gmaps4rails.build_markers(@rino) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def caphill
    @caphill = Explore.where(location: 'Cap Hill')
    @hash = Gmaps4rails.build_markers(@caphill) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def uptown
    @uptown = Explore.where(location: 'Uptown')
    @hash = Gmaps4rails.build_markers(@uptown) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end

  def nearby
    if params['Restaurant_name']
      @explores = Explore.where(
        ["Restaurant_name like ?", params[:restaurant_name] + '%']
      ) #.paginate
    else
      @explores = Explore.order(
        sort_column + ' ' + sort_direction
      ) #.paginate(page: params[:page])
    @nearby = Explore.all
    @hash = Gmaps4rails.build_markers(@nearby) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
    end
    end
# GET /explores/1
# GET /explores/1.json
def show
end

# GET /explores/new
def new
  @explore = Explore.new
end

# GET /explores/1/edit
def edit
end

# POST /explores
# POST /explores.json
def create
  @explore = Explore.new(explore_params)

  respond_to do |format|
    if @explore.save
      format.html { redirect_to @explore, notice: 'Explore was successfully created.' }
      format.json { render :show, status: :created, location: @explore }
    else
      format.html { render :new }
      format.json { render json: @explore.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /explores/1
# PATCH/PUT /explores/1.json
def update
  respond_to do |format|
    if @explore.update(explore_params)
      format.html { redirect_to @explore, notice: 'Explore was successfully updated.' }
      format.json { render :show, status: :ok, location: @explore }
    else
      format.html { render :edit }
      format.json { render json: @explore.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /explores/1
# DELETE /explores/1.json
def destroy
  @explore.destroy
  respond_to do |format|
    format.html { redirect_to explores_url, notice: 'Explore was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_explore
  @explore = Explore.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def explore_params
  params.require(:explore).permit(:restaurant_name, :latitude, :longitude, :food_type, :deals, :hours, :location, :address)
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

def sort_column
  Explore.column_names.include?(params[:sort]) ? params[:sort] : "restaurant_name"
end
end
