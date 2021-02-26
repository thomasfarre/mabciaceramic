module Admin
  class AttachmentsController < Admin::ApplicationController
    before_action :set_attachement

    def destroy
      resource.send(attachment_name).find(params[:id]).purge
    end

    private

    def set_attachement
      @attachment = ActiveStorage::Attachment.find(params[:id])
    end

    def resource
      resource_class.find(resource_id)
    end

    def resource_class
      @attachment.record_type.constantize
    end

    def resource_id
      @attachment.record_id
    end

    def attachment_name
      @attachment.name
    end
  end
end
