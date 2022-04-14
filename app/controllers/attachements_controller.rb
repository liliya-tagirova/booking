# frozen_string_literal: true

class AttachementsController < ApplicationController
  def purge
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    flash[:success] = 'Picture deleted!'
    redirect_back fallback_location: root_path
  end
end
