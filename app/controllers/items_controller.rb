class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :role_two, :only => [:index]
  before_filter :role_three, :only => [:edit, :update]
  before_filter :role_four, :only => [:new, :create, :toggle_activeness]
  before_filter :role_five, :only => [:destroy]

  # GET /items
  def index
    @active_items = Item.active
    @inactive_items = Item.inactive
  end

  # GET /items/1
  def show
    @carted_item = CartedItem.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find params[:id]
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.is_deleted = false
    logger.info " ****** #{@item.inspect}"
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  def update
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  def destroy
    CartedItem.where(item_id: @item.id).each do | carted | 
      carted.destroy
    end
    @item.destroy_item
    @item.save(:validate => false)
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_activeness
    item = Item.find(params[:id])
    if item.active?
      item.active = false
      CartedItem.where(item_id: params[:id]).each do | carted |
        carted.destroy
      end
    else
      item.active = true
    end
    if item.save(:validate=>false)
      respond_to do |format|
        format.html { redirect_to items_path, :success => "Item was #{item.active? ? "activated" : "deactivated"}" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to items_path, :error => "An error has occured." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      if Item.exists?(id: params[:id])
        @item = Item.find(params[:id])
        if @item.is_deleted
          flash[:alert] = "The item you requested is marked as deleted."
          redirect_to root_path
        end
      else
        flash[:alert] = "Could not find an item with that ID."
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit!
    end

end
