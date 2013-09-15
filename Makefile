all: test

test: hvrecon.zip
	du -b hvrecon.zip
	find hvrecon.zip -size -13312c -print

hvrecon.zip: *.html img/*.png
	zip hvrecon.zip *.html img/*.png

clean:
	rm -rf hvrecon.zip

publish:
	rsync -avz --files-from=manifest.txt ./ frankmitchell.org:/home/public/hvrecon/
