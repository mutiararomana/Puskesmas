class ResepSearch < ActiveRecord::Base
    
    def initialize(params)
#        params ||= {}
        @date = parsed_date(params[:date], Date.today.to_s)
    end
    
    def scope
        Resep.where('created_at LIKE ?%', @date)
    end
    
    private
    
    def parsed_date(date_string, default)
        Date.parse(date_string)
    rescue ArgumentError, TypeError
        default
    end
    
end
