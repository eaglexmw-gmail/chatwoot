class SlackUploadsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :set_blob, only: [:show]

  def show
    if @blob
      blob_service_url = url_for(@blob.representation(resize_to_fill: [250, nil]))
      redirect_to blob_service_url
    else
      render plain: 'Blob not found', status: :not_found
    end
  end

  private

  def set_blob
    @blob = ActiveStorage::Blob.find_by(key: params[:key])
  end
end
