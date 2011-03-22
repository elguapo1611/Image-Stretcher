class ImageConversionsController < ApplicationController
  include ImageConversionsHelper
  
  def index
    @path = "#{RAILS_ROOT}/public/images/library/"
    @src_url = "/images/library/"
    @images = Dir.glob("#{@path}*.jpg").map{|image| File.basename(image)}
  end
  
  def convert_image
    path = CGI::unescape(params[:path])
    file = params[:file_name]
    output_path = "/images/test/"
    puts "#{path}#{file}"
    converted_url = convert_image_from_path("#{path}#{file}", "#{RAILS_ROOT}/public/images/test/")
    @converted_file = {:src => File.basename(file), :converted => converted_url, :output_path => output_path}
    render :json => @converted_file.to_json
  end
end
