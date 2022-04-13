module ErrorHanding
    extend ActiveSupport::Concern

    included do
        rescue_from ActiveRecord::RecordNotFound, with: :notfound


        private 
            
        def notfound(exception)
            logger.warn exception
            render file: "public/404.html" , layout: false , status: :not_found

        end
    end
end