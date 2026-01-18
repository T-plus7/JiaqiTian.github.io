from pdf2image import convert_from_path
import os

pdf_path = r"w:\CV\JiaqiTian.github.io\images\mechanism_doctor.pdf"
output_folder = r"w:\CV\JiaqiTian.github.io\images"
image_name = "mechanism_doctor.png"

print(f"Converting {pdf_path} at 1200 DPI...")
try:
    images = convert_from_path(pdf_path, dpi=800)
    if images:
        images[0].save(os.path.join(output_folder, image_name), "PNG")
        print(f"Saved {image_name}")
    else:
        print("No images converted.")
except Exception as e:
    print(f"Error: {e}")
