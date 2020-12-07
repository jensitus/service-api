class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :update, :destroy]

  # GET /bookmarks
  def index
    @bookmarks = []
    Bookmark.all.each do |b|
      bookmark = {
          id: b.id,
          url: decrypt_and_verify(b.url),
          description: decrypt_and_verify(b.description),
          user_id: b.user_id,
          created_at: b.created_at,
          updated_at: b.updated_at
      }
      @bookmarks << bookmark
    end
    render json: @bookmarks
  end

  # GET /bookmarks/1
  def show
    bookmark = {
        id: @bookmark.id,
        url: decrypt_and_verify(@bookmark.url),
        description: decrypt_and_verify(@bookmark.description),
        user_id: @bookmark.user_id,
        created_at: @bookmark.created_at,
        updated_at: @bookmark.updated_at
    }
    render json: bookmark
  end

  # POST /bookmarks
  def create
    encrypted_url = encrypt_and_sign(bookmark_params['url'])
    encrypted_description = encrypt_and_sign(bookmark_params['description'])
    @bookmark = current_user.bookmarks.create!(url: encrypted_url, description: encrypted_description)

    if @bookmark.save
      render json: @bookmark, status: :created, location: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      render json: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bookmark_params
    params.require(:bookmark).permit(:url, :description, :user)
  end
end
