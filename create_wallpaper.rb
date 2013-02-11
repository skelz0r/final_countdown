require 'RMagick'
include Magick

h = 900
w = 1600
countdown = Time.utc(2014,02,11)
now = Time.now
bg = 'black'
fg = 'white'
path_to_wallpaper = '/home/skelz0r/'
file_name = "final_countdown.png"
space = 80

f = Image.new(w, h) { self.background_color = 'black' }

text = Magick::Draw.new
text.font_family = 'helvetica'
text.pointsize = 100
text.gravity = Magick::CenterGravity
text.font_weight = BoldWeight
text.font_stretch = ExpandedStretch


text.annotate(f, 0,0,2,-1*space, "10 000 000 users") {
	self.fill = fg
}

text.pointsize = 150

text.annotate(f, 0,0,2,space, "D - #{((countdown-now)/(60*60*24)).to_i.to_s}") {
	self.fill = fg
}

f.write(path_to_wallpaper + file_name)
#f.display
exit
