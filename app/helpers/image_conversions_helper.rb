module ImageConversionsHelper
  require 'RMagick'
  include Magick
  
  def convert_image_from_path(src, output_dir, options = {})
    begin
      img =  Image.read(src).first
    rescue => e
      return {:errors => e}
    end
    
    image_name = file_name_without_directory_or_extension(src)
    converted_img = stretch_convert_image(img)
    converted_name = converted_file_name(image_name)
    write_image(converted_img, output_dir, converted_name)
    converted_name
  end
  
  def convert_image_from_url(src_url, output_dir)
    img =  Image.read(file).first
    converted_img = convert_image(img)
    write_image(converted_img, output_dir)
  end
  
private 

  # takes an rmagick image and returns a new converted image
  def stretch_convert_image(img, start_x = 0, start_y = 0, width = 640, height = 480)
    new_image = img.crop(0,0,width,4).adaptive_resize(width, height)
    return new_image
  end
  
  def write_image(img, path, name)
    puts img.inspect
    img.write("#{path}#{name}")
  end
  
  # returns the filename
  def file_name_without_directory(filename)
    File.basename(filename)
  end
  
  def file_name_without_directory_or_extension(filename)
    File.basename(filename, ".jpg")
  end
  
  def converted_file_name(original_file_name)
    "#{original_file_name}_converted.jpg"
  end
  
  
end
