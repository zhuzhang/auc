module ApplicationHelper
    def bootstrap_class_for flash_type
        {sucess: 'alert-success', error: 'alert-error',
         alert: 'alert-block', notice: 'alert-notice'}[flash_type] || flash_type.to_s
    end
end
