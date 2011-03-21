module ImageConversionsHelper
  require 'RMagick'
  include Magick
  
  def convert_image_from_path(src, output_dir)
    begin
      img =  Image.read(src).first
    rescue => e
      return {:errors => e}
    end
    
    image_name = file_name_without_directory(src)
    
    puts image_name
    
    converted_img = stretch_convert_image(img)
    # write_image(converted_img, output_path, name)
  end
  
  def convert_image_from_url(src_url, output_dir)
    img =  Image.read(file).first
    converted_img = convert_image(img)
    write_image(converted_img, output_path)
  end
  
private 

  # takes an rmagick image and returns a new converted image
  def stretch_convert_image(img, width = 640, height = 480)
    new_image = img.crop(0,0,width,4)
    scaled_image = new_image.adaptive_resize(width, height)
    # converted_path = file_name_without_directory_or_extension(file)
  end
  
  def write_image(img, path, name)
    img.write("#{path}#{name}")
  end
  
  # returns the filename
  def file_name_without_directory(filename)
    filename
  end
  
  def file_name_without_directory_or_extension(filename)
    file_name_without_directory(filename)
  end
  
end
