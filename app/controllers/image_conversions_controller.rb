class ImageConversionsController < ApplicationController
  include ImageConversionsHelper
  
  def index
    
    @converted_files = []
    
    begin 
      # files.each_with_index do |file, i|
      #         
      #       end
    rescue => e
      # puts files.inspect
    end

    # puts @converted_files.inspect
    
    
  end
  
  def convert_image
    file = CGI::unescape(params[:path])
    converted_url = convert_image_from_path(file, "#{RAILS_ROOT}/public/test/")
    @converted_file = {:src => file_name_without_directory(file), :converted => converted_url}
    render :text => @converted_file.to_json
  end
end
