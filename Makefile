frames:
	Rscript R/create-frames.R

gif:
	convert -delay 25 plot/*.png gif/out.gif