class ItemCategoriesController < ApplicationController
  before_action :set_item_category, only: [:show, :edit, :update, :destroy]
  before_filter :role_zero, :only => [:show]
  before_filter :role_one, :only => [:index]
  before_filter :role_two, :only => [:edit, :update]
  before_filter :role_three, :only => [:new, :create]
  before_filter :role_four, :only => [:destroy]


  # GET /item_categories
  def index
    @active_item_categories = ItemCategory.active
    @inactive_item_categories = ItemCategory.inactive
  end

  # GET /item_categories/1
  def show
    @item_category = ItemCategory.find(params[:id])
  end

  # GET /item_categories/new
  def new
    @item_category = ItemCategory.new
  end

  # GET /item_categories/1/edit
  def edit
  end

  # POST /item_categories
  def create
    @item_category = ItemCategory.new(item_category_params)
    @item_category.active = true
    @item_category.is_deleted = false


    respond_to do |format|
      if @item_category.save
        format.html { redirect_to @item_category, notice: 'Item category was successfully created.' }
        format.json { render :show, status: :created, location: @item_category }
      else
        format.html { render :new }
        format.json { render json: @item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_categories/1
  def update
    respond_to do |format|
      if @item_category.update(item_category_params)
        format.html { redirect_to @item_category, notice: 'Item category was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_category }
      else
        format.html { render :edit }
        format.json { render json: @item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_categories/1
  def destroy
    @item_category.delete_category = true
    @item_category.save(:validate => false)
    respond_to do |format|
      format.html { redirect_to item_categories_url, notice: 'Item category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_category
      @item_category = ItemCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_category_params
      params.require(:item_category).permit(:name, :description)
    end
end
