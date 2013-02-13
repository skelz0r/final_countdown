require 'RMagick'
include Magick

h = 900
w = 1600
countdown = Time.utc(2014,02,11)
now = Time.now
bg = 'black'
fg = '#478CE5'
path_to_wallpaper = '/home/skelz0r/'
file_name = "final_countdown.png"
space = (h/3)-50

f = Image.new(w, h) { self.background_color = 'black' }
shutdown = Image.read("stuffs/shutdown.jpg").first

shutdown.resize_to_fit!(0,(h/3)-30)

text = Magick::Draw.new
text.font = 'stuffs/chintzy.ttf'
text.pointsize = 100
text.gravity = Magick::CenterGravity
text.font_weight = BoldWeight
text.font_stretch = ExpandedStretch
text.fill = fg

text.annotate(f, 0,0,2,-1*space, "10 000 000 users") 

text.pointsize = 150

text.annotate(f, 0,0,2, space+50, "D - #{((countdown-now)/(60*60*24)).to_i.to_s}")

final_img = f.composite(shutdown, Magick::CenterGravity, Magick::OverCompositeOp)

final_img.write(path_to_wallpaper + file_name)
#f.display
exit
